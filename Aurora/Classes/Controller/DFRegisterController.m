//
//  DFRegisterController.m
//  ViewPagerTest
//
//  Created by David on 14-3-25.
//  Copyright (c) 2014年 flame_thupdi. All rights reserved.
//

#import "DFRegisterController.h"

@interface DFRegisterController ()

@end

@implementation DFRegisterController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return NO;
}

- (void)dealloc {
    [_account release];
    [_password release];
    [_pwdConfirm release];
    [_identity release];
    [super dealloc];
}
- (IBAction)finishPressed:(UIBarButtonItem *)sender {
}
@end