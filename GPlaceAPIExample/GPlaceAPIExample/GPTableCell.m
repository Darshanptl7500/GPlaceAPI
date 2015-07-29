//
//  GPTableCell.m
//  GPlaceAPIExample
//
//  Created by Darshan Patel on 7/29/15.
//  Copyright (c) 2015 Darshan Patel. All rights reserved.
//

#import "GPTableCell.h"

@implementation GPTableCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

@end
