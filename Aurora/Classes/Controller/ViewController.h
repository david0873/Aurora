//
//  ViewController.h
//  ViewPagerTest
//
//  Created by flame_thupdi on 13-4-17.
//  Copyright (c) 2013年 flame_thupdi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewPager.h"

@interface ViewController : UIViewController<ViewPagerDelegate>
{
    ViewPager* _vp;
}
//@property (strong, nonatomic) IBOutlet ViewPager *viewPager;
@end
