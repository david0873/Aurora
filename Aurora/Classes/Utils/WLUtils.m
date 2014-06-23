//
//  WLUtils.m
//  Aurora
//
//  Created by liwang on 14-6-22.
//  Copyright (c) 2014年 david. All rights reserved.
//

#import "WLUtils.h"

@implementation WLUtils

+ (CGFloat)displayWidth
{
    UIInterfaceOrientation orientation = [UIApplication sharedApplication].statusBarOrientation;
    CGFloat width = [UIScreen mainScreen].bounds.size.height;
    if (orientation == UIInterfaceOrientationPortrait ||
        orientation == UIInterfaceOrientationPortraitUpsideDown) {
        width = [UIScreen mainScreen].bounds.size.width;
    }
    
    return width;
}

+ (CGFloat)displayHeight
{
    
    UIInterfaceOrientation orientation = [UIApplication sharedApplication].statusBarOrientation;
    CGFloat height = [UIScreen mainScreen].bounds.size.width;
    if (orientation == UIInterfaceOrientationPortrait ||
        orientation == UIInterfaceOrientationPortraitUpsideDown) {
        height = [UIScreen mainScreen].bounds.size.height;
    }

    
    return height;
}


+ (CGFloat)statusBarHeight
{
    CGSize statusBarSize = [[UIApplication sharedApplication] statusBarFrame].size;
    CGFloat height = (statusBarSize.height > statusBarSize.width) ? statusBarSize.width : statusBarSize.height;
    
    return height;
}


+ (UIColor *)colorWithRed:(CGFloat)r green:(CGFloat)g blue:(CGFloat)b
{
    CGFloat red = r/0xFF;
    CGFloat green = g/0xFF;
    CGFloat blue = b/0xFF;
    return [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
}

@end
