//
//  DFSignController.h
//  ViewPagerTest
//
//  Created by David on 14-3-25.
//  Copyright (c) 2014年 flame_thupdi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DFLoginController : UIViewController<UITextFieldDelegate>

@property (retain, nonatomic) IBOutlet UITextField *account;
@property (retain, nonatomic) IBOutlet UITextField *password;

- (IBAction)cancelPressed:(UIBarButtonItem *)sender;
- (IBAction)loginPressed:(id)sender;

@end
