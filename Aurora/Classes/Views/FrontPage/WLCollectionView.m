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

- (void)addCellByModel:(WLCollectionCellModel *)model
{
    WLCollectionCell *cell = [[WLCollectionCell alloc] initWithImage:model.cellImage title:model.cellTitle action:model.cellAction];
    
    CGRect frame = cell.frame;
    frame.origin.x = _nextCellX;
    frame.origin.y = _nextCellY;
    if (_nextCellY == 0) {
        [cell firstRow];
    }
    cell.frame = frame;
    
    [self addSubview:cell];
    
    if ((_nextCellX + CGRectGetWidth(frame)) >= CGRectGetWidth(self.frame)) {
        _nextCellX = 0;
        _nextCellY += CGRectGetHeight(frame);
        frame = self.frame;
        frame.size.height = _nextCellY;
        self.frame = frame;
    }
    else {
        _nextCellX += CGRectGetWidth(frame);
        frame = self.frame;
        frame.size.height += _nextCellY + CGRectGetHeight(cell.frame);
        self.frame = frame;
    }
    
}



@end
