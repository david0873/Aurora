//
//  WLTabBar.m
//  Aurora
//
//  Created by liwang on 14-6-22.
//  Copyright (c) 2014年 david. All rights reserved.
//

#import "WLTabBar.h"
#import "WLUtils.h"

#define kItemWidth

@implementation WLTabBar
@synthesize delegate;
@synthesize curItemID;
@synthesize items;

- (id)initWithFrame:(CGRect)frame delegate:(id<WLTabBarDelegate>)aDelegate
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.delegate = aDelegate;
        self.items = [NSMutableArray array];
        
        NSInteger index = 0;
        WLTabBarItem *item = nil;
        CGFloat itemWidth = [WLUtils displayWidth] / 4;
        CGRect itemFrame = CGRectMake(0*itemWidth, 0, itemWidth, kTabBarHeight);
        
        while (index < 4) {
            itemFrame.origin.x = index * itemWidth;
            NSString *title = [NSString stringWithFormat:@"%ldaaaa", index];
            item = [[WLTabBarItem alloc] initWithFrame:itemFrame aId:index delegate:self title:title image:nil];
            [self addSubview:item];
            [self.items addObject:item];
            
            index ++;
        }
        
        
    }
    return self;
}


- (void)selectItem:(NSInteger)itemID
{
    self.curItemID = itemID;
    WLTabBarItem *item = [self.items objectAtIndex:itemID];
    [item select];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (void)didSelectedItem:(NSInteger)itemID
{
    if (self.curItemID == itemID) {
        return;
    }
    //
    if ([self.delegate respondsToSelector:@selector(didSelectedItem:)]) {
        [self.delegate didSelectedItem:itemID];
    }
}

@end
