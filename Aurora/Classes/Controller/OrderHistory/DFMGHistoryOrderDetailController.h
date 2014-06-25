//
//  DFMGHistroyOrderDetailController.h
//  Aurora
//
//  Created by David on 14-6-25.
//  Copyright (c) 2014年 david. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DFUserOrder.h"

@interface DFMGHistoryOrderDetailController : UITableViewController

@property (copy, nonatomic) DFUserOrder * selection;
@property (weak, nonatomic) id delegate;
@property (assign, nonatomic) NSInteger row;

@property (strong, nonatomic) IBOutlet UILabel *labelNumber;
@property (strong, nonatomic) IBOutlet UILabel *labelStartTime;
@property (strong, nonatomic) IBOutlet UILabel *labelEndTime;
@property (strong, nonatomic) IBOutlet UILabel *lableSeatType;
@property (strong, nonatomic) IBOutlet UITextView *labelComment;
@property (strong, nonatomic) IBOutlet UITextView *labelRemarks;
@property (weak, nonatomic) IBOutlet UITextField *textMinConsume;
@property (weak, nonatomic) IBOutlet UITextField *textDeposit;
@property (strong, nonatomic) IBOutlet UILabel *orderStatus;

@end
