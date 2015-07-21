//
//  GPQueryAutoCompleteRequest.m
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

#import "GPQueryAutoCompleteRequest.h"

@implementation GPQueryAutoCompleteRequest
- (instancetype)initWithInput:(NSString *)input
{
    self = [super init];
    if (self)
    {
        NSAssert(input, @"Please specify input");
        _input = input;
        _offset = NSIntegerMax;
        _radius = NSIntegerMax;
        
    }
    return self;
}
- (void)doFetchPlacesByQueryAutoComplete:(GoogleQueryAutoCompleteHandler)block;
{
    [[GPlacesAPIClient sharedClient] GET:@"queryautocomplete/json" parameters:[self params] success:^(NSURLSessionDataTask * __unused task, id JSON) {
        
        GPQueryAutoCompleteResponse *response = [[GPQueryAutoCompleteResponse alloc] initWithAttributes:JSON];
        
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
    
    NSAssert(![kGOOGLE_PLACE_API_KEY isEqualToString:@""], @"Please Enter API Key");
    
    params[@"key"] = kGOOGLE_PLACE_API_KEY;
    
    params[@"location"] = [NSString stringWithFormat:@"%f,%f",_location.latitude,_location.longitude];
    
    if (_input) {
        
        params[@"input"] = _input;
        
    }
    
    if (_language) {
        
        params[@"language"] = _language;
    }
    
    if (_offset != NSIntegerMax) {
        
        params[@"offset"] = [NSNumber numberWithInteger:_offset];
    }
    
    if (_radius!= NSIntegerMax) {
        
        params[@"radius"] = [NSNumber numberWithInteger:_radius];
    }
    
    
    return params;
    
}
@end
