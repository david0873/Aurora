//
//  WLCollectionObj.m
//  Aurora
//
//  Created by liwang on 14-6-24.
//  Copyright (c) 2014年 david. All rights reserved.
//

#import "WLCollectionCellModel.h"

@implementation WLCollectionCellModel

- (id)initWithImage:(UIImage *)image title:(NSString *)title action:(SEL)action aId:(NSInteger)aId
{
    if (self = [super init]) {
        _cellImage = image;
        _cellTitle = title;
        _cellAction = action;
        _cellID = aId;
    }
    
    return self;
}


@end
