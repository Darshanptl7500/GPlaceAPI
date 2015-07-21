//
//  TextSearchController.m
//  GPlaceAPIExample
//
//  Created by IQR IT on 7/21/15.
//  Copyright (c) 2015 Darshan Patel. All rights reserved.
//

#import "TextSearchController.h"
#import "GPHeader.h"
#import <UIImageView+AFNetworking.h>

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

    GPTextSearchRequest *request = [[GPTextSearchRequest alloc] initWithQuery:@"restaurants in Sydney"];
    [request doFetchPlacesByTextSearch:^(GPTextSearchResponse *response, NSError *error) {
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
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] ;
    }
    
    GPResult *result = self.results[indexPath.row];
    
    cell.textLabel.text = result.name;
    [cell.imageView setImageWithURL:[NSURL URLWithString:result.icon]];
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
