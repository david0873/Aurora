//
//  WLTabBarItem.m
//  Aurora
//
//  Created by liwang on 14-6-22.
//  Copyright (c) 2014年 david. All rights reserved.
//

#import "WLTabBarItem.h"

@interface WLTabBarItem ()
{
    UIView *_bgView;
    UIButton *_button;
}

@property(nonatomic, strong)NSString *itemTitle;
@property(nonatomic, strong)UIImage *itemImage;

- (void)touchDown;

- (void)touchUpInside;

- (void)touchOut;


@end


@implementation WLTabBarItem
@synthesize delegate;
@synthesize itemID;
@synthesize itemTitle;
@synthesize itemImage;

- (id)initWithFrame:(CGRect)frame
                aId:(NSInteger)aId
           delegate:(id<WLTabBarItemDelegate>)aDelegate
              title:(NSString *)title
              image:(UIImage *)image;
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.delegate = aDelegate;
        self.itemID = aId;
        self.itemTitle = title;
        self.backgroundColor = [UIColor lightGrayColor];
        _bgView = [[UIView alloc] initWithFrame:self.bounds];
        _bgView.backgroundColor = [UIColor whiteColor];
        
        _button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [_button setTitle:self.itemTitle forState:UIControlStateNormal];
        _button.frame = CGRectMake(0, 0, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame));
        [_button addTarget:self action:@selector(touchUpInside) forControlEvents:UIControlEventTouchUpInside];
        [_button addTarget:self action:@selector(touchDown) forControlEvents:UIControlEventTouchDown];
        [_button addTarget:self action:@selector(touchOut) forControlEvents:UIControlEventTouchDragOutside];
        [self addSubview:_button];
        
        
        
        
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

- (void)touchDown
{}

- (void)touchUpInside
{
    if ([self.delegate respondsToSelector:@selector(didSelectedItem:)]) {
        [self.delegate didSelectedItem:self.itemID];
    }
}

- (void)touchOut
{}

- (void)deSelect
{}

- (void)select
{
    _button.tintColor = [UIColor redColor];
}

@end
