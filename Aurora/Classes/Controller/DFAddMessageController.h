//
//  DFMGMessageController.h
//  Aurora
//
//  Created by David on 14-6-27.
//  Copyright (c) 2014年 david. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DFAddMessageController : UIViewController<UITextViewDelegate, UIPickerViewDelegate,UIPickerViewDataSource, UIAlertViewDelegate>

@property (strong, nonatomic) IBOutlet UITextField *textShopName;
@property (strong, nonatomic) IBOutlet UITextView *textMessage;
- (IBAction)okPressed:(UIButton *)sender;

@property (nonatomic,retain) UIPickerView *shopPicker;

@end
