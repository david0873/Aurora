//
//  DFOrderDetailController.h
//  Aurora
//
//  Created by yubiao on 14-6-18.
//  Copyright (c) 2014年 david. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DFUserOrder.h"

@interface DFOrderDetailController : UITableViewController<UITextViewDelegate>
@property (copy, nonatomic) DFUserOrder * userOrder;
@property (weak, nonatomic) id delegate;
@property (assign, nonatomic) NSInteger row;

@property (strong, nonatomic) IBOutlet UILabel *labelNumber;
@property (strong, nonatomic) IBOutlet UILabel *labelStartTime;
@property (strong, nonatomic) IBOutlet UILabel *labelEndTime;
@property (strong, nonatomic) IBOutlet UILabel *lableSeatType;
@property (strong, nonatomic) IBOutlet UITextView *labelComment;
@property (strong, nonatomic) IBOutlet UITextView *labelRemarks;
@property (weak, nonatomic) IBOutlet UILabel *labelDeposit;
@property (weak, nonatomic) IBOutlet UILabel *labelMinConsume;
@property (strong, nonatomic) IBOutlet UIButton *btnPay;


//- (IBAction)backPressed:(UIBarButtonItem *)sender;

@end
