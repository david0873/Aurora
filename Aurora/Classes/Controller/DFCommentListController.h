//
//  DFCommentListController.h
//  Aurora
//
//  Created by David on 14-4-18.
//  Copyright (c) 2014年 david. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DFShop.h"

@interface DFCommentListController : UITableViewController

@property (copy, nonatomic) DFShop * shop;
@property (nonatomic, strong) NSMutableArray *comments;

- (IBAction)AddComment:(UIBarButtonItem *)sender;
- (IBAction)backPressed:(UIBarButtonItem *)sender;
@end
