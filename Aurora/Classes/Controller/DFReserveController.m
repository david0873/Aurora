//
//  DFReserveController.m
//  ViewPagerTest
//
//  Created by David on 14-3-17.
//  Copyright (c) 2014年 flame_thupdi. All rights reserved.
//

#import "DFReserveController.h"
#import <QuartzCore/QuartzCore.h>

@interface DFReserveController ()

@end

@implementation DFReserveController

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
    
    _numPicker = [[UIPickerView alloc] init];
    _numPicker.dataSource = self;
    _numPicker.delegate = self;
    
    
    UIToolbar *numToolBar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 44)];
    UIBarButtonItem *numOKButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self
                                                                                action:@selector(numChanged)];
    // 把按鈕加進 UIToolbar
    numToolBar.items = [NSArray arrayWithObject:numOKButton];
    
    // textfield num
    self.numTextField.inputView = _numPicker;
    self.numTextField.inputAccessoryView = numToolBar;
    
    // 建立 UIDatePicker
    _datePicker = [[UIDatePicker alloc]init];
    [_datePicker addTarget:self action:@selector(dateChanged:) forControlEvents:UIControlEventValueChanged];
    
    UIToolbar *timeToolBar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 44)];
    UIBarButtonItem *right = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self
                                                                          action:@selector(dateOKPressed)];
    // 把按鈕加進 UIToolbar
    timeToolBar.items = [NSArray arrayWithObject:right];
    
    _timeBeginTextField.inputView = _datePicker;
    _timeBeginTextField.inputAccessoryView = timeToolBar;
    _timeEndTextField.inputView = _datePicker;
    _timeEndTextField.inputAccessoryView = timeToolBar;
    
    
    _remarkText.layer.borderColor = UIColor.grayColor.CGColor;
    _remarkText.layer.borderWidth =1.0;
    _remarkText.layer.cornerRadius =5.0;
    _remarkText.delegate = self;
    
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

#pragma mark click event

-(void)dateChanged:(id) sender{
    
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setDateFormat:@"yyyy-MM-dd HH:mm"];
    
    if ([_timeBeginTextField isFirstResponder]) {
        _timeBeginTextField.text = [NSString stringWithFormat:@"%@", [df stringFromDate:_datePicker.date]];
    } else if([_timeEndTextField isFirstResponder]){
        _timeEndTextField.text = [NSString stringWithFormat:@"%@", [df stringFromDate:_datePicker.date]];
    }
    
}

- (void)dateOKPressed{
    if ( [_timeBeginTextField isFirstResponder] ) {
        [_timeBeginTextField resignFirstResponder];
    } else if ( [_timeEndTextField isFirstResponder] ) {
        [_timeEndTextField resignFirstResponder];
    }
    
}

- (IBAction)reserveBtnPressed:(UIButton *)sender {
    UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"预定结果" message:@"预定成功" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [alert show];
}

- (void)numChanged {
    if ([self.view endEditing:NO]) {
        NSInteger row = [_numPicker selectedRowInComponent:0];
        _numTextField.text = [NSString stringWithFormat:@"%i", row+1];
    }
}

#pragma mark -
#pragma mark Picker Data Source Methods

- (NSInteger) numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return 20;
}

#pragma Picker Delegate Methods
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return [NSString stringWithFormat:@"%i", row + 1];
}

- (void)dealloc {
    [_numTextField release];
    [_timeBeginTextField release];
    [_timeEndTextField release];
    [_seatType release];
    [_remarkText release];
    [super dealloc];
}
@end
