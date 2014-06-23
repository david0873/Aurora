//
//  WLCollectionView.m
//  Aurora
//
//  Created by liwang on 14-6-18.
//  Copyright (c) 2014年 david. All rights reserved.
//

#import "WLCollectionView.h"
#import "WLUtils.h"

@interface WLCollectionView ()
{
    CGFloat _nextCellX;
    CGFloat _nextCellY;
}


@end

@implementation WLCollectionView

- (id)initWithOrigin:(CGPoint)origin
{
    CGRect frame = CGRectZero;
    frame.origin = origin;
    frame.size = CGSizeZero;
    frame.size.width = [WLUtils displayWidth];
    
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor whiteColor];
        _nextCellX = 0;
        _nextCellY = 0;
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (void)addCell:(WLCollectionCell *)cell
{
    CGRect frame = cell.frame;
    frame.origin.x = _nextCellX;
    frame.origin.y = _nextCellY;
    cell.frame = frame;
    
    [self addSubview:cell];
    
    if ((_nextCellX + CGRectGetWidth(frame)) >= CGRectGetWidth(self.frame)) {
        _nextCellX = 0;
        _nextCellY += CGRectGetWidth(frame);
        frame = self.frame;
        frame.size.height = _nextCellY;
        self.frame = frame;
    }
    else {
        _nextCellX += CGRectGetWidth(frame);
        frame = self.frame;
        frame.size.height += _nextCellY + CGRectGetWidth(cell.frame);
        self.frame = frame;
    }
    
}

@end
