//
//  WLVIewCreater.h
//  Aurora
//
//  Created by liwang on 14-6-23.
//  Copyright (c) 2014年 david. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WLVIewCreater : NSObject

+ (CAShapeLayer *)lineLayerWithStartPoint:(CGPoint)start
                                 endPoint:(CGPoint)end
                                    width:(CGFloat)width
                                    color:(UIColor *)color;

@end
