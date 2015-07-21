//
//  GPlaceAPISetup.m
//  GPlaceAPIExample
//
//  Created by Darshan Patel on 21/07/15.
//  Copyright (c) 2015 Darshan Patel. All rights reserved.
//

#import "GPlaceAPISetup.h"

@implementation GPlaceAPISetup
+ (instancetype)sharedInstance
{
    static GPlaceAPISetup *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[GPlaceAPISetup alloc] init];
    });
    return sharedInstance;
}

@end
