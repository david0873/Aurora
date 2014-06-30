//
//  DFMGMessageController.m
//  Aurora
//
//  Created by David on 14-6-27.
//  Copyright (c) 2014年 david. All rights reserved.
//

#import "DFAddMessageController.h"
#import "DFMessage.h"

@interface DFAddMessageController ()

@end

NSArray * shopNames;

@implementation DFAddMessageController

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
    _shopPicker = [[UIPickerView alloc] init];
    _shopPicker.dataSource = self;
    _shopPicker.delegate = self;
    
    shopNames = @[@"酒吧1",@"酒吧2",@"酒吧3",@"会所1",@"会所2",@"会所3",@"KTV1",@"KTV2",@"KTV3"];
    
    
    UIToolbar *shopToolBar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 44)];
    UIBarButtonItem *oKButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self
                                                                                action:@selector(shopChanged)];
    // 把按鈕加進 UIToolbar
    shopToolBar.items = [NSArray arrayWithObject:oKButton];
    
    // textfield num
    self.textShopName.inputView = _shopPicker;
    self.textShopName.inputAccessoryView = shopToolBar;
    
    _textMessage.delegate = self;
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

- (void)shopChanged {
    if ([self.view endEditing:NO]) {
        NSInteger row = [_shopPicker selectedRowInComponent:0];
        self.textShopName.text = [shopNames objectAtIndex:row];
    }
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

- (IBAction)okPressed:(UIButton *)sender {
    NSArray* myPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString* myDocPath = [myPaths objectAtIndex:0];
    NSString* path = [myDocPath stringByAppendingPathComponent:@"msg.plist"];
    
    NSMutableArray * array = [NSKeyedUnarchiver unarchiveObjectWithFile: path];
    
    if (array == nil) {
        array = [[NSMutableArray alloc] init];
    }
    
    DFMessage * message = [[DFMessage alloc]init];
    message.message = _textMessage.text;
    message.shopName = _textShopName.text;
    
    [array addObject:message];
    
    [NSKeyedArchiver archiveRootObject:array toFile:path];
    
    UIAlertView *alert = [[UIAlertView alloc]
                          initWithTitle:nil
                          message:@"添加成功"
                          delegate:self
                          cancelButtonTitle:@"确定"
                          otherButtonTitles:nil];
    [alert show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark -
#pragma mark Picker Data Source Methods

- (NSInteger) numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return shopNames.count;
}

#pragma Picker Delegate Methods
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return [shopNames objectAtIndex:row];
}
@end
