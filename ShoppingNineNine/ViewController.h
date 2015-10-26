//
//  ViewController.h
//  ShoppingNineNine
//
//  Created by yishain chen on 2015/10/24.
//  Copyright (c) 2015年 yishain chen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MenuViewController.h"
@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIButton *hotProduct;
@property (weak, nonatomic) IBOutlet UIButton *couponProduct;
@property (weak, nonatomic) IBOutlet UIButton *LatestProduct;
@property (weak, nonatomic) IBOutlet UIButton *latestActive;
@end

