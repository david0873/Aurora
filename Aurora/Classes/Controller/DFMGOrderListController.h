//
//  DFMGOrderListController.h
//  Aurora
//
//  Created by David on 14-4-4.
//  Copyright (c) 2014年 david. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DFOderDealController.h"

@interface DFMGOrderListController : UITableViewController<DFOrderDealControllerDelegate>

@property (nonatomic, strong) NSMutableArray *psOders;

- (IBAction)backPressed:(UIBarButtonItem *)sender;

@end
