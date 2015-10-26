//
//  SearchViewController.h
//  ShoppingNineNine
//
//  Created by yishain chen on 2015/10/25.
//  Copyright © 2015年 yishain chen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
{
IBOutlet UITableView *displayTableView;
IBOutlet UISearchBar *searchBar;

    
IBOutlet UISearchDisplayController *searchBarController;
NSMutableArray *contentList;
NSMutableArray *filteredContentList;
}


@end
