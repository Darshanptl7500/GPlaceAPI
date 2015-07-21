//
//  GooglePlaceSearch.h
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

#import <Foundation/Foundation.h>
#import "GPHeader.h"

typedef NS_ENUM(NSInteger, GPPriceLevel) {
    GPPriceLevelFree = 0,
    GPPriceLevelInexpensive,
    GPPriceLevelModerate,
    GPPriceLevelExpensive,
    GPPriceLevelVeryExpensive
};
@class GPOpeningHours;
@interface GPResult : NSObject

@property (nonatomic,strong) NSString *icon;
@property (nonatomic,strong) NSString *name;
@property (nonatomic,strong) NSString *place_id;
@property (nonatomic,assign) double rating;
@property (nonatomic,strong) NSString *reference;
@property (nonatomic,strong) NSString *scope;
@property (nonatomic,strong) NSArray *types;
@property (nonatomic,strong) NSString *vicinity;
@property (nonatomic,strong) GPGeometry *geometry;
@property (nonatomic,strong) GPOpeningHours *opening_hours;
@property (nonatomic,strong) NSArray *photos;
@property (nonatomic,strong) NSString *formatted_address;
@property (nonatomic,assign) GPPriceLevel price_level;
@property (nonatomic,strong) NSArray *address_components;
@property (nonatomic,strong) NSString *adr_address;
@property (nonatomic,strong) NSString *formatted_phone_number;
@property (nonatomic,strong) NSString *international_phone_number;
@property (nonatomic,strong) NSArray *reviews;
@property (nonatomic,strong) NSString *url;
@property (nonatomic,assign) NSInteger user_ratings_total;
@property (nonatomic,assign) NSInteger utc_offset;
@property (nonatomic,strong) NSString *website;


- (instancetype)initWithAttributes:(NSDictionary *)attributes;

@end
