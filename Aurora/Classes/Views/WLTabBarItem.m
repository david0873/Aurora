//
//  WLTabBarItem.m
//  Aurora
//
//  Created by liwang on 14-6-22.
//  Copyright (c) 2014年 david. All rights reserved.
//

#import "WLTabBarItem.h"
#import "WLUtils.h"

#define kImageSize 25

@interface WLTabBarItem ()
{
    UIView *_bgView;
    UIButton *_button;
    UIImageView *_itemImage;
    UILabel *_itemTitle;
    
    BOOL _isSelected;
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
        _bgView.userInteractionEnabled = NO;
        
        _itemImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon_tabbar_merchant_normal.png"]];
        CGFloat x = (CGRectGetWidth(frame) - kImageSize) / 2;
        _itemImage.frame = CGRectMake(x, 6, kImageSize, kImageSize);
        [_bgView addSubview:_itemImage];
        
        _itemTitle = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_itemImage.frame), CGRectGetWidth(frame), CGRectGetHeight(frame) - CGRectGetMaxY(_itemImage.frame))];
        _itemTitle.text = title;
        _itemTitle.backgroundColor = [UIColor clearColor];
        _itemTitle.textColor = [UIColor lightGrayColor];
        _itemTitle.textAlignment = NSTextAlignmentCenter;
        _itemTitle.font = [UIFont systemFontOfSize:10];
        [_bgView addSubview:_itemTitle];
        
        
        
        
        _button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        
        _button.frame = CGRectMake(0, 0, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame));
        [_button addTarget:self action:@selector(touchUpInside) forControlEvents:UIControlEventTouchUpInside];
        [_button addTarget:self action:@selector(touchDown) forControlEvents:UIControlEventTouchDown];
        [_button addTarget:self action:@selector(touchOut) forControlEvents:UIControlEventTouchDragOutside];
        _button.exclusiveTouch = YES;
        
        [self addSubview:_button];
        
        [_button addSubview:_bgView];
        
        
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
{
    if (_isSelected) {
        return;
    }
    _itemImage.image = [UIImage imageNamed:@"icon_tabbar_merchant_selected.png"];
    _itemTitle.textColor = [WLUtils colorWithRed:46 green:182 blue:168];
}

- (void)touchUpInside
{
    if (_isSelected) {
        return;
    }
    
    if ([self.delegate respondsToSelector:@selector(didSelectedItem:)]) {
        [self.delegate didSelectedItem:self.itemID];
    }
    [self deSelect];
}

- (void)touchOut
{
    if (_isSelected) {
        return;
    }
    
    _itemImage.image = [UIImage imageNamed:@"icon_tabbar_merchant_normal.png"];
    _itemTitle.textColor = [UIColor lightGrayColor];
}

- (void)deSelect
{
    _itemImage.image = [UIImage imageNamed:@"icon_tabbar_merchant_normal.png"];
    _itemTitle.textColor = [UIColor lightGrayColor];
}

- (void)select
{
    _isSelected = YES;
    _itemImage.image = [UIImage imageNamed:@"icon_tabbar_merchant_selected.png"];
    _itemTitle.textColor = [WLUtils colorWithRed:46 green:182 blue:168];
}

@end
