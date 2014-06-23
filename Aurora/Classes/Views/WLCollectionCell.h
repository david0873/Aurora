//
//  WLCollectionCell.h
//  Aurora
//
//  Created by liwang on 14-6-18.
//  Copyright (c) 2014年 david. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kCellNumberForRow 4

#define kCellHeight   [WLUtils displayWidth] / kCellNumberForRow

@interface WLCollectionCell : UIView

- (id)initWithImage:(UIImage *)image title:(NSString *)title action:(SEL) action;


@property(nonatomic, strong)UIImage *cellImage;
@property(nonatomic, strong)NSString *cellTitle;
@property(nonatomic)SEL cellAction;


@end
