//
//  WLCollectionView.h
//  Aurora
//
//  Created by liwang on 14-6-18.
//  Copyright (c) 2014年 david. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WLCollectionCell.h"

@interface WLCollectionView : UIView

- (id)initWithOrigin:(CGPoint)origin;

- (void)addCell:(WLCollectionCell *)cell;

@end
