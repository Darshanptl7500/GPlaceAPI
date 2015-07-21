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

#import "GPResult.h"

@implementation GPResult
- (instancetype)initWithAttributes:(NSDictionary *)attributes
{
    self = [super init];
    if (!self) {
        return nil;
    }
    
    self.icon =[attributes valueForKeyPath:@"icon"];
    self.name =[attributes valueForKeyPath:@"name"];
    self.place_id =[attributes valueForKeyPath:@"place_id"];
    self.reference =[attributes valueForKeyPath:@"reference"];
    self.scope =[attributes valueForKeyPath:@"scope"];
    self.vicinity =[attributes valueForKeyPath:@"vicinity"];
    self.rating =[[attributes valueForKeyPath:@"rating"] doubleValue];
    self.types =[attributes valueForKeyPath:@"types"];
    self.geometry = [[GPGeometry alloc] initWithAttributes:[attributes valueForKeyPath:@"geometry"]];
    self.opening_hours = [[GPOpeningHours alloc] initWithAttributes:[attributes valueForKeyPath:@"opening_hours"]];
    self.formatted_address =[attributes valueForKeyPath:@"formatted_address"];
    self.price_level = [[attributes valueForKeyPath:@"price_level"] integerValue];
    self.photos =[self photos:attributes];
    self.address_components = [self addressComponents:attributes];
    self.adr_address = [attributes valueForKeyPath:@"adr_address"];
    self.formatted_phone_number = [attributes valueForKeyPath:@"formatted_phone_number"];
    self.international_phone_number = [attributes valueForKeyPath:@"international_phone_number"];
    self.url = [attributes valueForKeyPath:@"url"];
    self.user_ratings_total = [[attributes valueForKeyPath:@"user_ratings_total"] integerValue];
    self.utc_offset = [[attributes valueForKeyPath:@"utc_offset"] integerValue];
    self.website = [attributes valueForKeyPath:@"website"];
    self.reviews = [self reviews:attributes];
    self.price_level =[self priceLevel:[attributes valueForKeyPath:@"price_level"]];
    
    return self;
}

-(NSMutableArray *)addressComponents:(NSDictionary *)info
{
    NSArray *tempList =info[@"address_components"];
    
    NSMutableArray *arrList = [[NSMutableArray alloc] init];
    
    for (int i=0; i<[tempList count]; i++) {
        
        GPAddressComponents *addressComponent =[[GPAddressComponents alloc] initWithAttributes:tempList[i]];
        [arrList addObject:addressComponent];
    }
    
    return arrList;
}

-(NSMutableArray *)reviews:(NSDictionary *)info
{
    NSArray *tempList =info[@"reviews"];
    
    NSMutableArray *arrList = [[NSMutableArray alloc] init];
    
    for (int i=0; i<[tempList count]; i++) {
        
        GPReviews *review =[[GPReviews alloc] initWithAttributes:tempList[i]];
        [arrList addObject:review];
    }
    
    return arrList;
}
-(NSMutableArray *)photos:(NSDictionary *)info
{
    NSArray *tempList =info[@"photos"];
    
    NSMutableArray *arrList = [[NSMutableArray alloc] init];
    
    for (int i=0; i<[tempList count]; i++) {
        
        GPPhoto *photo =[[GPPhoto alloc] initWithAttributes:tempList[i]];
        [arrList addObject:photo];
    }
    
    return arrList;
}

- (GPPriceLevel)priceLevel:(NSString *)string
{
    if ([string isEqualToString:@"0"]) {
        
        return GPPriceLevelFree;
        
    } else if ([string isEqualToString:@"1"]) {
        
        return GPPriceLevelInexpensive;
    }
    else if ([string isEqualToString:@"2"]) {
        
        return GPPriceLevelModerate;
    }
    else if ([string isEqualToString:@"3"]) {
        
        return GPPriceLevelExpensive;
    }
    else if ([string isEqualToString:@"4"]) {
        
        return GPPriceLevelVeryExpensive;
        
    }
    return 0;
}

@end
