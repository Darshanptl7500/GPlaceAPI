//
//  NearbyPlaceSearchController.h
//  GPlaceAPIExample
//
//  Created by Darshan Patel on 7/21/15.
//  Copyright (c) 2015 Darshan Patel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GPHeader.h"

@interface NearbyPlaceSearchController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong) IBOutlet UITableView *tblPlaceSearch;
@end
