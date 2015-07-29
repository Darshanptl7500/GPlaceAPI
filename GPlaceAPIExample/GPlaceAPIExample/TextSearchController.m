//
//  TextSearchController.m
//  GPlaceAPIExample
//
//  Created by Darshan Patel on 7/21/15.
//  Copyright (c) 2015 Darshan Patel. All rights reserved.
//

#import "TextSearchController.h"
#import "GPHeader.h"
#import <UIImageView+AFNetworking.h>
#import <SVProgressHUD.h>
#import "GPTableCell.h"

@interface TextSearchController ()
@property (nonatomic,strong) NSMutableArray *results;
@end

@implementation TextSearchController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"Text Search";
    
    [self doCallTextSearchWebservice];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)doCallTextSearchWebservice
{
    [SVProgressHUD show];
    GPTextSearchRequest *request = [[GPTextSearchRequest alloc] initWithQuery:@"restaurants in Sydney"];
    [request doFetchPlacesByTextSearch:^(GPTextSearchResponse *response, NSError *error) {
        [SVProgressHUD dismiss];
        if (!error) {
            
            if (response.status == GPRequestStatusOK) {
                
                self.results =[[NSMutableArray alloc] initWithArray:response.results];
                
                [self.tblTextSearch reloadData];
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
    
    GPTableCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
   
    
    GPResult *result = self.results[indexPath.row];
    
    NSArray *photos = result.photos;
    
    if (photos.count!=0) {
       
        GPPhoto *photo = photos[0];
        
       [cell.parallaxImage setImageWithURL:[NSURL URLWithString:[photo getPhotoUrl:cell.parallaxImage.frame.size.width*2 withHeight:cell.parallaxImage.frame.size.height*2]] placeholderImage:nil];
      
    }
    else
    {
          [cell.parallaxImage setImageWithURL:[NSURL URLWithString:result.icon] placeholderImage:nil];
    
    }
    
    cell.titleLabel.text = result.name;
    
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 150;
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    // Get visible cells on table view.
    NSArray *visibleCells = [self.tblTextSearch visibleCells];
    
    for (GPTableCell *cell in visibleCells) {
        [self GPTableCell:self.tblTextSearch didScrollOnView:self.view withCell:cell];
    }
}

- (void)GPTableCell:(UITableView *)tableView didScrollOnView:(UIView *)view withCell:(GPTableCell*)cell
{
    CGRect rectInSuperview = [tableView convertRect:cell.frame toView:view];
    
    float distanceFromCenter = CGRectGetHeight(view.frame)/2 - CGRectGetMinY(rectInSuperview);
    float difference = CGRectGetHeight(cell.parallaxImage.frame) - CGRectGetHeight(cell.frame);
    float move = (distanceFromCenter / CGRectGetHeight(view.frame)) * difference;
    
    CGRect imageRect = cell.parallaxImage.frame;
    imageRect.origin.y = -(difference/2)+move;
    cell.parallaxImage.frame = imageRect;
    
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
