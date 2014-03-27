//
//  FirstViewController.h
//  ViewPagerTest
//
//  Created by David on 14-3-13.
//  Copyright (c) 2014年 flame_thupdi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DFShopDetailController : UIViewController

@property (copy, nonatomic) NSString *imageUrl;
@property (copy, nonatomic) NSString *workTime;
@property (copy, nonatomic) NSString *avgConsume;
@property (copy, nonatomic) NSString *address;
@property (copy, nonatomic) NSString *tel;

@property (retain, nonatomic) IBOutlet UIImageView *shopImage;
@property (retain, nonatomic) IBOutlet UILabel *labelWorkTime;
@property (retain, nonatomic) IBOutlet UILabel *labelAvgConsume;
@property (retain, nonatomic) IBOutlet UILabel *labelAddress;
@property (retain, nonatomic) IBOutlet UILabel *labelTEL;

- (IBAction)homePressed:(UIBarButtonItem *)sender;
- (IBAction)reservePressed:(UIButton *)sender;
- (IBAction)commentPressed:(UIButton *)sender;

@end
