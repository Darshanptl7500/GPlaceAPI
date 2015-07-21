//
//  GPReviewsAspects.m
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

#import "GPReviewsAspects.h"

@implementation GPReviewsAspects
- (instancetype)initWithAttributes:(NSDictionary *)attributes
{
    self = [super init];
    if (!self) {
        return nil;
    }
  
    self.rating =[[attributes valueForKeyPath:@"rating"] integerValue];
    self.type =[self type:[attributes valueForKeyPath:@"type"]];
    
    return self;
}
- (GPReviewAspectType)type:(NSString *)string
{
    
    if ([string isEqualToString:@"appeal"]) {
        
        return GPReviewAspectTypeAppeal;
        
    } else if ([string isEqualToString:@"atmosphere"]) {
        
        return GPReviewAspectTypeAtmosphere;
    }
    else if ([string isEqualToString:@"decor"]) {
        
        return GPReviewAspectTypeDecor;
    }
    else if ([string isEqualToString:@"facilities"]) {
        
        return GPReviewAspectTypeFacilities;
    }
    else if ([string isEqualToString:@"food"]) {
        
        return GPReviewAspectTypeFood;
        
    }else if ([string isEqualToString:@"overall"]) {
        
        return GPReviewAspectTypeOverall;
    }
    else if ([string isEqualToString:@"quality"]) {
        
        return GPReviewAspectTypeQuality;
    }
    else if ([string isEqualToString:@"service"]) {
        
        return GPReviewAspectTypeService;
    }
    
    return 0;
}
@end
