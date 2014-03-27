//
//  DFReserveController.h
//  ViewPagerTest
//
//  Created by David on 14-3-17.
//  Copyright (c) 2014年 flame_thupdi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DFReserveController : UIViewController<UIPickerViewDelegate,UIPickerViewDataSource, UIActionSheetDelegate, UITextViewDelegate>

@property (retain, nonatomic) IBOutlet UITextField *numTextField;
@property (retain, nonatomic) IBOutlet UITextField *timeBeginTextField;
@property (retain, nonatomic) IBOutlet UITextField *timeEndTextField;
@property (retain, nonatomic) IBOutlet UISegmentedControl *seatType;
@property (retain, nonatomic) IBOutlet UITextView *remarkText;

@property (nonatomic,retain) UIDatePicker *datePicker;
@property (nonatomic,retain) UIPickerView *numPicker;

- (IBAction)reserveBtnPressed:(UIButton *)sender;
- (void) numChanged;
- (void) dateChanged:(id)sender;
- (void) dateOKPressed;
@end
