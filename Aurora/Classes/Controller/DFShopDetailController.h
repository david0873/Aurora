//
//  FirstViewController.h
//  ViewPagerTest
//
//  Created by David on 14-3-13.
//  Copyright (c) 2014年 flame_thupdi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DFShop.h"
#import "ViewController.h"

@interface DFShopDetailController : UIViewController<ViewPagerDelegate>{
    ViewPager *viewPager;
}

@property (copy, nonatomic) DFShop * shop;

@property (retain, nonatomic) IBOutlet UILabel *labelWorkTime;
@property (retain, nonatomic) IBOutlet UILabel *labelAvgConsume;
@property (retain, nonatomic) IBOutlet UILabel *labelAddress;

- (IBAction)reservePressed:(UIButton *)sender;
- (IBAction)commentPressed:(UIButton *)sender;
@end
