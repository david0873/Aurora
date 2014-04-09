//
//  DFSignController.m
//  ViewPagerTest
//
//  Created by David on 14-3-25.
//  Copyright (c) 2014年 flame_thupdi. All rights reserved.
//

#import "DFLoginController.h"
#import "DFAppDelegate.h"
#import "DFGlobalVar.h"

@interface DFLoginController ()

@end

@implementation DFLoginController

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
    _account.delegate = self;
    _password.delegate= self;
    
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
    [super dealloc];
}

- (IBAction)cancelPressed:(UIBarButtonItem *)sender {
    
    DFAppDelegate *thisAppDelegate = [[UIApplication sharedApplication] delegate];
    [(UITabBarController *)thisAppDelegate.window.rootViewController setSelectedIndex:0];
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

- (IBAction)loginPressed:(id)sender {
    DFUser * user = [DFUser alloc];
    user.userName = _account.text;
    user.nibName = @"张三";
    
    [DFGlobalVar sharedGlobalVar].user = user;
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
