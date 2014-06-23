//
//  YBAddCommentController.m
//  Aurora
//
//  Created by yubiao on 14-6-22.
//  Copyright (c) 2014年 david. All rights reserved.
//

#import "YBAddCommentController.h"
#import "DFComment.h"
#import "DFGlobalVar.h"


@interface YBAddCommentController ()

@end

@implementation YBAddCommentController

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
    
    
    _comment.layer.borderColor = UIColor.grayColor.CGColor;
    _comment.layer.borderWidth =1.0;
    _comment.layer.cornerRadius =5.0;
    _comment.delegate = self;
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if ([text isEqualToString:@"\n"])
    {
        [textView resignFirstResponder];
    }
    return YES;
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

- (IBAction)backPressed:(UIBarButtonItem *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)okPressed:(UIButton *)sender {
    NSArray* myPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString* myDocPath = [myPaths objectAtIndex:0];
    NSString *path = [myDocPath stringByAppendingPathComponent:@"comment.plist"];
    
    NSMutableArray * array = [NSKeyedUnarchiver unarchiveObjectWithFile: path];
    
    if (array == nil) {
        array = [[NSMutableArray alloc] init];
    }
    
    
    DFComment * comment = [DFComment alloc];
    comment.commentId = @"1";
    comment.hiDegree = _hidegree.value;
    comment.content = _comment.text;
    comment.shopId = _shop.shopId;
    
    comment.user = [DFGlobalVar sharedGlobalVar].user;
    
//    order.shopId= _shop.shopId;
//    order.shopName = _shop.shopName;
//    order.number = [_numTextField.text intValue];
//    
//
//    
//    order.remarks = _remarkText.text;
//    
//    order.orderId = @"242412424";
//    
//    int seatType = [_seatType selectedSegmentIndex];
//    order.seatType = seatType == 0 ? @"卡座" : @"散台";
//    
//    order.user = [DFGlobalVar sharedGlobalVar].user;
//    order.orderStatus = 0;
//    
    [array addObject:comment];
    
    [NSKeyedArchiver archiveRootObject:array toFile:path];
    
    NSString * message = @"说完了";
    
    UIAlertView *alert = [[UIAlertView alloc]
                          initWithTitle:nil
                          message:message
                          delegate:self
                          cancelButtonTitle:@"确定"
                          otherButtonTitles:nil];
    [alert show];
  //  [alert release];
    
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
