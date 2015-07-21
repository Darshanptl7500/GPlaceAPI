//
//  TextSearchController.h
//  GPlaceAPIExample
//
//  Created by IQR IT on 7/21/15.
//  Copyright (c) 2015 Darshan Patel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TextSearchController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong) IBOutlet UITableView *tblTextSearch;
@end
