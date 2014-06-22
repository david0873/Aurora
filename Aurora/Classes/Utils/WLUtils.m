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
    
    CGFloat scale = [UIScreen mainScreen].scale;
    width *= scale;
    
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
    
    CGFloat scale = [UIScreen mainScreen].scale;
    height *= scale;
    
    return height;
}


+ (CGFloat)statusBarHeight
{
    CGSize statusBarSize = [[UIApplication sharedApplication] statusBarFrame].size;
    CGFloat height = (statusBarSize.height > statusBarSize.width) ? statusBarSize.width : statusBarSize.height;
    CGFloat scale = [UIScreen mainScreen].scale;
    
    return height*scale;
}


@end
