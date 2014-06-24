//
//  WLCollectionCellModel.h
//  Aurora
//
//  Created by liwang on 14-6-24.
//  Copyright (c) 2014年 david. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WLCollectionCellModel : NSObject

@property (nonatomic) UIImage *cellImage;
@property (nonatomic) NSString *cellTitle;
@property (nonatomic) SEL cellAction;
@property (nonatomic) NSInteger cellID;

- (id)initWithImage:(UIImage *)image title:(NSString *)title action:(SEL)action id:(NSInteger)aId;

@end
