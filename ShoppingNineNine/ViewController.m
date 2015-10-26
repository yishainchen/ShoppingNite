//
//  ViewController.m
//  ShoppingNineNine
//
//  Created by yishain chen on 2015/10/24.
//  Copyright (c) 2015年 yishain chen. All rights reserved.
//

#import "ViewController.h"
#import <SlideNavigationController.h>
#import <AFNetworking/AFNetworking.h>
#import "MenuViewController.h"

@interface ViewController () <SlideNavigationControllerDelegate,UITableViewDataSource,UITableViewDelegate>
{
    NSString *urlString;
    UILabel *introLabel;
    UILabel *priceLabel;
    UIImageView *imgPic;
    
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"bg_navigation"] forBarMetrics:
     UIBarMetricsDefault];
    
   
    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"bg_navigation"]
                                       forBarMetrics:UIBarMetricsDefault];
    
    [[UITabBar appearance] setBackgroundImage:[UIImage imageNamed:@"bg_navigation"]];
   

    self.hotProduct.selected = YES;
    
    [self getdata];

}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)slideNavigationControllerShouldDisplayLeftMenu
{
    return YES;
}

- (BOOL)slideNavigationControllerShouldDisplayRightMenu
{
    return YES;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 3;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil){
        
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    //tag UI
    introLabel = (UILabel *)[cell viewWithTag:1];
    introLabel.tag = indexPath.row ;
    
    priceLabel = (UILabel *)[cell viewWithTag:2];
    priceLabel.tag = indexPath.row ;
    
    imgPic = (UIImageView *)[cell viewWithTag:3];
    imgPic.tag = indexPath.row ;
    
    return cell;
}

-(void)getdata {
    if (self.hotProduct.selected == YES) {
        urlString = @"http://app.shopping99.com/auth/authAccess.jsp?authKey=e586e8c9a21f33331a3c2b842d16b3e5";
    }
    else if(self.LatestProduct.selected == YES) {
        urlString = @"";
    }
    else if(self.latestActive.selected == YES) {
        urlString = @"";
    }
    else if(self.couponProduct.selected == YES) {
        urlString = @"";
    }
    
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager POST:@"http://app.shopping99.com/auth/authAccess.jsp?authKey=e586e8c9a21f33331a3c2b842d16b3e5" parameters:@"authKey=e586e8c9a21f33331a3c2b842d16b3e5"
          success:^(AFHTTPRequestOperation *operation, id responseObject) {
              NSLog(@"success");
              NSLog(@"response: %@", responseObject);
          } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
              NSLog(@"failure: %@", error);
          }];
}

- (IBAction)hotProduct:(UIButton *)sender {
  sender.selected=!sender.selected;
    if (self.hotProduct.selected == YES) {
        self.couponProduct.selected = NO;
        self.latestActive.selected = NO;
        self.LatestProduct.selected = NO;
    }
}
- (IBAction)couponProduct:(UIButton *)sender {
    sender.selected=!sender.selected;
    if (self.couponProduct.selected == YES) {
        self.latestActive.selected = NO;
        self.LatestProduct.selected = NO;
        self.hotProduct.selected = NO;
    }
}
- (IBAction)LatestProduct:(UIButton *)sender {
    sender.selected=!sender.selected;
    if (self.LatestProduct.selected == YES) {
        self.latestActive.selected = NO;
        self.hotProduct.selected = NO;
        self.couponProduct.selected = NO;
    }
}
- (IBAction)latestAction:(UIButton *)sender {
    sender.selected=!sender.selected;
    if (self.latestActive.selected == YES) {
        self.hotProduct.selected = NO;
        self.couponProduct.selected = NO;
        self.LatestProduct.selected =NO;
    }
}
@end
