//
//  NearbyPlaceSearchController.m
//  GPlaceAPIExample
//
//  Created by Darshan Patel on 7/21/15.
//  Copyright (c) 2015 Darshan Patel. All rights reserved.
//

#import "NearbyPlaceSearchController.h"
#import <UIImageView+AFNetworking.h>
#import <SVProgressHUD/SVProgressHUD.h>

@interface NearbyPlaceSearchController ()
@property (nonatomic,strong) NSMutableArray *results;
@end

@implementation NearbyPlaceSearchController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"Nearby Search";
    
    [self doCallNearBySearchWebservice];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)doCallNearBySearchWebservice
{
    [SVProgressHUD show];
    CLLocationCoordinate2D location =CLLocationCoordinate2DMake(37.76999, -122.44696);
    
    GPPlaceSearchRequest *request =[[GPPlaceSearchRequest alloc] initWithLocationCoordinate:location];
    request.radius = 500;
    request.rankby = GPRankByDistance;
    request.types = [NSArray arrayWithObjects:@"hospital",@"bank",@"atm", nil];
    [request doFetchPlaces:^(GPPlaceSearchResponse *response, NSError *error) {
        
        [SVProgressHUD dismiss];
        
        if (!error) {
            
            if (response.status == GPRequestStatusOK) {
                
                self.results =[[NSMutableArray alloc] initWithArray:response.results];
                
                [self.tblPlaceSearch reloadData];
            }
        }
        
    }];
}
#pragma mark - UITableViewDelegate & UITableViewDatasource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    return self.results.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] ;
    }
    
    GPResult *result = self.results[indexPath.row];
   
    NSArray *photos = result.photos;
    
    if (photos.count!=0) {
        
        GPPhoto *photo = photos[0];
       
        [cell.imageView setImageWithURL:[NSURL URLWithString:[photo getPhotoUrl:100 withHeight:100]]];
    }
    else
    {
        [cell.imageView setImageWithURL:[NSURL URLWithString:result.icon]];
    }
    
    cell.textLabel.text = result.name;
    return cell;
}
/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
