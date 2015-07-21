//
//  GooglePlaceSearch.m
//  APIManager
//
//  Created by Darshan Patel on 7/14/15.
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

#import "GPPlaceSearchRequest.h"


@implementation GPPlaceSearchRequest
- (instancetype)initWithLocationCoordinate:(CLLocationCoordinate2D)location
{
    self = [super init];
    if (self)
    {
        NSAssert(CLLocationCoordinate2DIsValid(_location), @"Please specify valid location");
        
        _location = location;
        _radius = 1000;
        _minprice = -1;
        _maxprice = -1;
        _rankby = GPRankByProminence;
        
    }
    return self;
}
- (void)doFetchPlaces:(GooglePlaceSearchHandler)block
{
    [[GPlacesAPIClient sharedClient] GET:@"nearbysearch/json" parameters:[self params] success:^(NSURLSessionDataTask * __unused task, id JSON) {
        
        GPPlaceSearchResponse *response = [[GPPlaceSearchResponse alloc] initWithAttributes:JSON];
        
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
    params[@"location"] = [NSString stringWithFormat:@"%f,%f",_location.latitude,_location.longitude];
    
    if (_radius) {
        NSAssert(_radius<=50000, @"Radius must not be greater than 50000");
        params[@"radius"] = [NSNumber numberWithInteger:_radius];
        
    }
    
    if (_keyword) {
        params[@"keyword"] = _keyword;
    }
    
    if (_maxprice != -1) {
        
        params[@"maxprice"] = [NSNumber numberWithInteger:_maxprice];
        
    }
    
    if (_minprice!= -1) {
        
        params[@"minprice"] = [NSNumber numberWithInteger:_minprice];
        
    }
    
    if (_name) {
        params[@"name"] = _name;
    }
    
    if (_opennow) {
        
        params[@"opennow"]= [NSNumber numberWithBool:_opennow];
        
    }
    
    if ([_types count] > 0) {
        
        params[@"types"] = [_types componentsJoinedByString:@"|"];
        
    }
    
    if (_pagetoken) {
        
        params[@"pagetoken"] = _pagetoken;
    }
    
    if (_rankby) {
        
        if (_rankby == GPRankByProminence) {
            
            params[@"rankBy"] = @"prominence";
            
        }else if(_rankby == GPRankByDistance)
        {
            params[@"rankBy"] = @"distance";
        }
        
    }
    return params;
    
}
@end
