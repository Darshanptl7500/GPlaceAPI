//
//  GPPlaceDetailsResponse.m
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

#import "GPPlaceDetailsResponse.h"

@implementation GPPlaceDetailsResponse
- (instancetype)initWithAttributes:(NSDictionary *)attributes
{
    self = [super init];
    if (!self) {
        return nil;
    }
    
    
    self.html_attributions =[attributes valueForKeyPath:@"html_attributions"];
    self.result =[[GPResult alloc] initWithAttributes:[attributes valueForKeyPath:@"result"]];
    
    self.status = [self requestStatus:[attributes valueForKeyPath:@"status"]];
    
    return self;
}
-(NSMutableArray *)results:(NSDictionary *)info
{
    NSArray *tempList =info[@"result"];
    
    NSMutableArray *arrList = [[NSMutableArray alloc] init];
    
    for (int i=0; i<[tempList count]; i++) {
        
        GPResult *list =[[GPResult alloc] initWithAttributes:tempList[i]];
        [arrList addObject:list];
    }
    
    return arrList;
}
- (GPRequestStatus)requestStatus:(NSString *)string
{
    if ([string isEqualToString:OK]) {
        
        return GPRequestStatusOK;
        
    } else if ([string isEqualToString:ZERO_RESULTS]) {
        
        return GPRequestStatusZERORESULTS;
    }
    else if ([string isEqualToString:OVER_QUERY_LIMIT]) {
        
        return GPRequestStatusOVERQUERYLIMIT;
    }
    else if ([string isEqualToString:REQUEST_DENIED]) {
        
        return GPRequestStatusREQUESTDENIED;
    }
    else if ([string isEqualToString:INVALID_REQUEST]) {
        
        return GPRequestStatusINVALIDREQUEST;
    }
    
    return 0;
}

@end
