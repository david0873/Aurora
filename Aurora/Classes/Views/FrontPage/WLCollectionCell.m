//
//  WLCollectionCell.m
//  Aurora
//
//  Created by liwang on 14-6-18.
//  Copyright (c) 2014年 david. All rights reserved.
//

#import "WLCollectionCell.h"
#import "WLUtils.h"

#define kTopMargin 14
#define kTopMargin2 7
#define kColumnMargin 20
#define kMargin 2
#define kTitleFont 16
#define kTitleHeight 20

@interface WLCollectionCell ()
{
    UIButton *_actionButton;
    UIImageView *_imageView;
    UILabel *_titleLabel;
}


- (void)addImage;
- (void)addTitle;

- (void)action;
- (void)touchDown;
- (void)touchOut;

@end


@implementation WLCollectionCell
@synthesize cellImage;
@synthesize cellTitle;
@synthesize cellBlock;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (id)initWithImage:(UIImage *)image
              title:(NSString *)title
             action:(WLCollectionBlock) action;
{
    CGRect frame = CGRectMake(0, 0, kCellHeight, kCellHeight);
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.cellImage = image;
        self.cellTitle = title;
        self.cellBlock = action;     
        
        _actionButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _actionButton.frame = frame;
        _actionButton.exclusiveTouch = YES;
        [_actionButton addTarget:self action:@selector(action) forControlEvents:UIControlEventTouchUpInside];
        [_actionButton addTarget:self action:@selector(touchDown) forControlEvents:UIControlEventTouchDown];
        [_actionButton addTarget:self action:@selector(touchOut) forControlEvents:UIControlEventTouchDragOutside];
        [self addSubview:_actionButton];
        
        [self addImage];
        [self addTitle];
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


/*
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event
{}
 */

- (void)addImage
{
    CGFloat width = CGRectGetWidth(self.frame)-kColumnMargin*2;
    _imageView = [[UIImageView alloc] initWithImage:self.cellImage];
    _imageView.frame = CGRectMake(kColumnMargin, kTopMargin2, width, width);
    [_actionButton addSubview:_imageView];
    
}

- (void)addTitle
{
    CGRect frame = CGRectMake(0, CGRectGetMaxY(_imageView.frame) + kMargin, CGRectGetWidth(self.frame), kTitleHeight);
    _titleLabel = [[UILabel alloc] initWithFrame:frame];
    _titleLabel.backgroundColor =[UIColor clearColor];
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    _titleLabel.textColor = [UIColor grayColor];
    _titleLabel.font = [UIFont systemFontOfSize:12];
    _titleLabel.text = self.cellTitle;
    [_actionButton addSubview:_titleLabel];
    
}


- (void)action
{
    _actionButton.backgroundColor = [UIColor whiteColor];
    if (self.cellBlock) {
        self.cellBlock();
    }
}

- (void)touchDown
{
    _actionButton.backgroundColor = [UIColor lightGrayColor];
}


- (void)touchOut
{
    _actionButton.backgroundColor = [UIColor whiteColor];
}

- (void)firstRow
{
    CGRect frame = _imageView.frame;
    frame.origin.y += kTopMargin - kTopMargin2;
    _imageView.frame = frame;
    frame = _titleLabel.frame;
    frame.origin.y += kTopMargin - kTopMargin2;
    _titleLabel.frame = frame;
}

@end
