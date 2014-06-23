//
//  WLVIewCreater.m
//  Aurora
//
//  Created by liwang on 14-6-23.
//  Copyright (c) 2014年 david. All rights reserved.
//

#import "WLVIewCreater.h"

@implementation WLVIewCreater


+ (CAShapeLayer *)lineLayerWithStartPoint:(CGPoint)start
                                 endPoint:(CGPoint)end
                                    width:(CGFloat)width
                                    color:(UIColor *)color
{
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, start.x, start.y);
    CGPathAddLineToPoint(path, NULL, end.x, end.y);
    
    CAShapeLayer *layer = [CAShapeLayer layer];
    [layer setStrokeColor:[color CGColor]];
    [layer setFillColor:[[UIColor clearColor] CGColor]];
    [layer setLineWidth:width];
    [layer setLineCap:kCALineJoinRound];
    [layer setLineJoin:kCALineJoinRound];
    [layer setPath:path];
    
    return layer;
}


@end
