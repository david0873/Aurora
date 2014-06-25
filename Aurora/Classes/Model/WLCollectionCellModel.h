//
//  WLCollectionCellModel.h
//  Aurora
//
//  Created by liwang on 14-6-24.
//  Copyright (c) 2014年 david. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WLCollectionCell.h"


@interface WLCollectionCellModel : NSObject

@property (nonatomic, strong) UIImage *cellImage;
@property (nonatomic, strong) NSString *cellTitle;
@property (nonatomic, strong) WLCollectionBlock cellAction;
@property (nonatomic) NSInteger cellID;

- (id)initWithImage:(UIImage *)image title:(NSString *)title action:(WLCollectionBlock)action aId:(NSInteger)aId;

@end
