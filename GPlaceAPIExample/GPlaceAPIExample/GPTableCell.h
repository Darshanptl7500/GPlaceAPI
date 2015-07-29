//
//  GPTableCell.h
//  GPlaceAPIExample
//
//  Created by Darshan Patel on 7/29/15.
//  Copyright (c) 2015 Darshan Patel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GPTableCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *parallaxImage;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end
