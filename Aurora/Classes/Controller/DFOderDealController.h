//
//  DFOderDealController.h
//  Aurora
//
//  Created by David on 14-4-8.
//  Copyright (c) 2014年 david. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DFUserOrder.h"

@protocol DFOrderDealControllerDelegate;

@interface DFOderDealController : UITableViewController<UITextViewDelegate, UITextFieldDelegate>
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


- (IBAction)okPressed:(UIButton *)sender;

- (IBAction)rejectPressed:(UIButton *)sender;
- (IBAction)backPressed:(UIBarButtonItem *)sender;

@end

@protocol DFOrderDealControllerDelegate <NSObject>

- (void)orderDealController:(DFOderDealController *)controller
                   didUpdateOrder:(DFUserOrder *)order;

@end
