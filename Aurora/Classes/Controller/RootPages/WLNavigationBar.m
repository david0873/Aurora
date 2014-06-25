//
//  WLNavigationBar.m
//  Aurora
//
//  Created by liwang on 14-6-25.
//  Copyright (c) 2014年 david. All rights reserved.
//

#import "WLNavigationBar.h"

@implementation WLNavigationBar

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
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
#define NAVIGATION_BTN_MARGIN 0
- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    UINavigationItem *navigationItem = [self topItem];
    
    for (UIView *subview in [self subviews]) {
        
        if (subview == [[navigationItem rightBarButtonItem] customView]) {
            
            /*
            CGRect newRightButtonRect = CGRectMake(self.frame.size.width - subview.frame.size.width - NAVIGATION_BTN_MARGIN,
                                                   (self.frame.size.height - subview.frame.size.height) / 2,
                                                   subview.frame.size.width,
                                                   subview.frame.size.height);
            [subview setFrame:newRightButtonRect];
             */
        } else if (subview == [[navigationItem leftBarButtonItem] customView]) {
            
            CGRect newLeftButtonRect = CGRectMake(NAVIGATION_BTN_MARGIN,
                                                  (self.frame.size.height - subview.frame.size.height) / 2,
                                                  subview.frame.size.width,
                                                  subview.frame.size.height);
            [subview setFrame:newLeftButtonRect];
        }
    } 
}

@end
