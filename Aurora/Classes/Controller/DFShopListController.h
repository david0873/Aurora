//
//  DfShopListController.h
//  ViewPagerTest
//
//  Created by David on 14-3-15.
//  Copyright (c) 2014年 flame_thupdi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RateView.h"

@interface DFShopListController : UIViewController<UITableViewDataSource,UITableViewDelegate>{
    IBOutlet UITableView *_tableView;
}
- (IBAction)homePressed:(UIBarButtonItem *)sender;

@end
