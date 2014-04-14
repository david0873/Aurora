//
//  FirstViewController.h
//  ViewPagerTest
//
//  Created by David on 14-3-13.
//  Copyright (c) 2014年 flame_thupdi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DFShop.h"

@interface DFShopDetailController : UIViewController

@property (copy, nonatomic) DFShop * shop;

@property (retain, nonatomic) IBOutlet UIImageView *shopImage;
@property (retain, nonatomic) IBOutlet UILabel *labelWorkTime;
@property (retain, nonatomic) IBOutlet UILabel *labelAvgConsume;
@property (retain, nonatomic) IBOutlet UILabel *labelAddress;
@property (retain, nonatomic) IBOutlet UILabel *labelTEL;

- (IBAction)reservePressed:(UIButton *)sender;
- (IBAction)commentPressed:(UIButton *)sender;
@end
