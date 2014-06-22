//
//  WLBasePage.m
//  Aurora
//
//  Created by liwang on 14-6-22.
//  Copyright (c) 2014年 david. All rights reserved.
//

#import "WLBasePage.h"

#define kNavBarHeight 44


@interface WLBasePage ()

- (void)createContentScrollView;

- (void)createTabBar;

@end

@implementation WLBasePage
@synthesize pageIndex;
@synthesize contentScrollView;
@synthesize tabBar;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createContentScrollView];
    [self createTabBar];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (void)createContentScrollView
{
    CGFloat contentHeight = [WLUtils displayHeight] - [WLUtils statusBarHeight] - kTabBarHeight - kNavBarHeight;
    
    CGRect contentFrame = CGRectMake(0, 0, [WLUtils displayWidth], contentHeight);
    self.contentScrollView = [[UIScrollView alloc] initWithFrame:contentFrame];
    self.contentScrollView.showsHorizontalScrollIndicator = NO;
    self.contentScrollView.showsVerticalScrollIndicator = NO;
    self.contentScrollView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.contentScrollView];
}

- (void)createTabBar
{
    CGRect frame = CGRectMake(0, CGRectGetMaxY(self.contentScrollView.frame), [WLUtils displayWidth], kTabBarHeight);
    self.tabBar = [[WLTabBar alloc] initWithFrame:frame delegate:self];
    [self.view addSubview:self.tabBar];
}

#pragma mark - TabBarDelegate

- (void)didSelectedItem:(NSInteger)itemID
{
    WLNavigationControlller *w = [[WLDataManager instance].mainPagesArray objectAtIndex:itemID];
    [UIApplication sharedApplication].keyWindow.rootViewController = w;
}

@end
