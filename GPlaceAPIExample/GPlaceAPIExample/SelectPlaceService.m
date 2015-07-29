//
//  ViewController.m
//  GPlaceAPIExample
//
//  Created by Darshan Patel on 21/07/15.
//  Copyright (c) 2015 Darshan Patel. All rights reserved.
//

#import "SelectPlaceService.h"
#import "NearbyPlaceSearchController.h"
#import "TextSearchController.h"

@interface SelectPlaceService ()

@end

@implementation SelectPlaceService

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"Select Service";
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDelegate & UITableViewDatasource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    return 2;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] ;
    }
    
    
    if (indexPath.row == 0) {
        
        cell.textLabel.text = @"Nearby Search";
        
    }else if (indexPath.row == 1) {
        
        cell.textLabel.text = @"Text Search";
        
    }
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.row == 0) {
        NearbyPlaceSearchController *objNearBy =[self.storyboard instantiateViewControllerWithIdentifier:@"NearbyPlaceSearchController"];
        [self.navigationController pushViewController:objNearBy animated:YES];
    }else if(indexPath.row == 1)
    {
        TextSearchController *objTextBy =[self.storyboard instantiateViewControllerWithIdentifier:@"TextSearchController"];
        [self.navigationController pushViewController:objTextBy animated:YES];
        
    }
    
}
@end
