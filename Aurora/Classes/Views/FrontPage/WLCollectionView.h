//
//  WLCollectionView.h
//  Aurora
//
//  Created by liwang on 14-6-18.
//  Copyright (c) 2014年 david. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WLCollectionCellModel.h"

@interface WLCollectionView : UIView

- (id)initWithOrigin:(CGPoint)origin;

- (void)addCellByModel:(WLCollectionCellModel *)model;

@end
