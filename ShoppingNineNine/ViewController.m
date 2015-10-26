//
//  ViewController.m
//  ShoppingNineNine
//
//  Created by yishain chen on 2015/10/24.
//  Copyright (c) 2015年 yishain chen. All rights reserved.
//

#import "ViewController.h"
#import "SlideNavigationController.h"
#import "LeftMenuViewController.h"
#import <SlideNavigationController.h>
#import <AFNetworking/AFNetworking.h>

@interface ViewController () <SlideNavigationControllerDelegate,UITableViewDataSource,UITableViewDelegate>


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"bg_navigation"] forBarMetrics:UIBarMetricsDefault];
    [[UITabBar appearance] setBackgroundImage:[UIImage imageNamed:@"bg_navigation"]];

    // Do any additional setup after loading the view, typically from a nib.
    
    
//    [ setDrawerViewController:drawerViewController forDirection:MSDynamicsDrawerDirectionLeft];

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
    return 6;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil){
        
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    return cell;
}

-(void)getdata {
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager POST:@"http://catchup.today/api/v1/events" parameters:@{@"event_id":@"24"}
          success:^(AFHTTPRequestOperation *operation, id responseObject) {
              NSLog(@"success");
              NSLog(@"response: %@", responseObject);
          } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
              NSLog(@"failure: %@", error);
          }];
}

@end
