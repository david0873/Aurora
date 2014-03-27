//
//  DFRegisterController.h
//  ViewPagerTest
//
//  Created by David on 14-3-25.
//  Copyright (c) 2014年 flame_thupdi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DFRegisterController : UIViewController<UITextFieldDelegate>

@property (retain, nonatomic) IBOutlet UITextField *account;
@property (retain, nonatomic) IBOutlet UITextField *password;
@property (retain, nonatomic) IBOutlet UITextField *pwdConfirm;
@property (retain, nonatomic) IBOutlet UISegmentedControl *identity;
- (IBAction)finishPressed:(UIBarButtonItem *)sender;

@end
