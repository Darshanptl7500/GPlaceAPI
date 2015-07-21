//
//  GPlaceAPISetup.h
//  GPlaceAPIExample
//
//  Created by Darshan Patel on 21/07/15.
//  Copyright (c) 2015 Darshan Patel. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GPlaceAPISetup : NSObject

@property (nonatomic,strong) NSString *Api_Key;
+ (instancetype)sharedInstance;
@end
