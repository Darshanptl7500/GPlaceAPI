//
//  GPPlaceDetailsRequest.m
//  APIManager
//
//  Created by Darshan Patel on 7/15/15.
//  Copyright (c) 2015 Darshan Patel. All rights reserved.
//
//  The MIT License (MIT)
//
//  Copyright (c) 2015 Darshan Patel
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.

#import "GPPlaceDetailsRequest.h"

@implementation GPPlaceDetailsRequest
- (instancetype)initWithPlaceID:(NSString *)placeid
{
    self = [super init];
    if (self)
    {
        NSAssert(placeid, @"Please specify Place id");
        _placeid = placeid;
        
    }
    return self;
}

- (void)doFetchPlacesDetails:(GooglePlaceDetailsHandler)block
{
    [[GPlacesAPIClient sharedClient] GET:@"details/json" parameters:[self params] success:^(NSURLSessionDataTask * __unused task, id JSON) {
        
        GPPlaceDetailsResponse *response = [[GPPlaceDetailsResponse alloc] initWithAttributes:JSON];
        
        if (block) {
            block(response, nil);
        }
        
    } failure:^(NSURLSessionDataTask *__unused task, NSError *error) {
        
        if (block) {
            block(nil, error);
        }
    }];
}
-(NSMutableDictionary *)params
{
    NSMutableDictionary *params =[[NSMutableDictionary alloc] init];
    
    NSAssert(![[GPlaceAPISetup sharedInstance].Api_Key isEqualToString:@""], @"Please Enter API Key");
    
    params[@"key"] = [GPlaceAPISetup sharedInstance].Api_Key;
    
    if (_placeid) {
        
        params[@"placeid"] = _placeid;
        
    }
    
    if (_language) {
        
        params[@"language"] = _language;
        
    }
    
    
    return params;
    
}
@end