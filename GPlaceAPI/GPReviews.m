//
//  GPReviews.m
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

#import "GPReviews.h"

@implementation GPReviews
- (instancetype)initWithAttributes:(NSDictionary *)attributes
{
    self = [super init];
    if (!self) {
        return nil;
    }
    
    
    self.author_name =[attributes valueForKeyPath:@"author_name"];
    self.author_url =[attributes valueForKeyPath:@"author_url"];
    self.language =[attributes valueForKeyPath:@"language"] ;
    self.rating =[[attributes valueForKeyPath:@"rating"] integerValue];
    self.text =[attributes valueForKeyPath:@"text"] ;
    self.time =[[attributes valueForKeyPath:@"time"] integerValue] ;
    self.aspects =[self aspects:attributes];
    
    return self;
}
-(NSMutableArray *)aspects:(NSDictionary *)info
{
    NSArray *tempList =info[@"aspects"];
    
    NSMutableArray *arrList = [[NSMutableArray alloc] init];
    
    for (int i=0; i<[tempList count]; i++) {
        
        GPReviewsAspects *aspect =[[GPReviewsAspects alloc] initWithAttributes:tempList[i]];
        [arrList addObject:aspect];
    }
    
    return arrList;
}

@end
