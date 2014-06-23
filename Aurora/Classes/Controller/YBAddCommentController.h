//
//  YBAddCommentController.h
//  Aurora
//
//  Created by yubiao on 14-6-22.
//  Copyright (c) 2014年 david. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SQRiskCursor.h"
#import "DFShop.h"


@interface YBAddCommentController : UIViewController<UITextViewDelegate, UIAlertViewDelegate, UIAlertViewDelegate>

@property (copy, nonatomic) DFShop * shop;

@property (weak, nonatomic) IBOutlet SQRiskCursor *hidegree;
@property (weak, nonatomic) IBOutlet UITextView *comment;

- (IBAction)backPressed:(UIBarButtonItem *)sender;

- (IBAction)okPressed:(UIButton *)sender;
@end
