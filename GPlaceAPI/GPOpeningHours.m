//
//  GPOpeningHours.m
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

#import "GPOpeningHours.h"

@implementation GPOpeningHours
- (instancetype)initWithAttributes:(NSDictionary *)attributes
{
    self = [super init];
    if (!self) {
        return nil;
    }
    
    self.open_now =[[attributes valueForKeyPath:@"open_now"] boolValue];
    self.weekday_text =[attributes valueForKeyPath:@"weekday_text"];
    self.periods = [self periods:attributes];
    return self;
}
-(NSMutableArray *)periods:(NSDictionary *)info
{
    NSArray *tempList =info[@"periods"];
    
    NSMutableArray *arrList = [[NSMutableArray alloc] init];
    
    for (int i=0; i<[tempList count]; i++) {
        
        GPOpeningHoursPeriods *periods =[[GPOpeningHoursPeriods alloc] initWithAttributes:tempList[i]];
        [arrList addObject:periods];
    }
    
    return arrList;
}
@end
