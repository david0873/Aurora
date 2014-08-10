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



- (void)createNavigationBackItem;

- (void)navigationBack;


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
    [self createNavigationBackItem];
    [self createContentScrollView];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
//    if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)])
//    {
//        self.navigationController.interactivePopGestureRecognizer.enabled = YES;
//        self.navigationController.interactivePopGestureRecognizer.delegate = nil;
//        
//    }
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
    CGFloat contentHeight = [WLUtils displayHeight] - [WLUtils statusBarHeight] - kNavBarHeight;
    CGRect contentFrame = CGRectMake(0, 0, [WLUtils displayWidth], contentHeight);
    self.contentScrollView = [[UIScrollView alloc] initWithFrame:contentFrame];
    self.contentScrollView.showsHorizontalScrollIndicator = NO;
    self.contentScrollView.showsVerticalScrollIndicator = NO;
    self.contentScrollView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.contentScrollView];
}

- (void)createTabBar
{
    CGRect frame = self.contentScrollView.frame;
    frame.size.height = [WLUtils displayHeight] - [WLUtils statusBarHeight] - kTabBarHeight - kNavBarHeight;
    self.contentScrollView.frame = frame;
    
    frame = CGRectMake(0, CGRectGetMaxY(self.contentScrollView.frame), [WLUtils displayWidth], kTabBarHeight);
    self.tabBar = [[WLTabBar alloc] initWithFrame:frame delegate:self];
    [self.view addSubview:self.tabBar];
    
    
}



- (void)createNavigationBackItem
{
    UIImage *normalImage = [UIImage imageNamed:@"ump_icon_back.png"];
    UIImage *highImage = [UIImage imageNamed:@"ump_icon_back_foucs.png"];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, normalImage.size.width/2, normalImage.size.height/2);
    [button setImage:normalImage forState:UIControlStateNormal];
    [button setImage:highImage forState:UIControlStateHighlighted];
    [button addTarget:self action:@selector(navigationBack) forControlEvents:UIControlEventTouchUpInside];

    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    self.navigationItem.leftBarButtonItem = backItem;
}


- (void)navigationBack
{
    [self.navigationController popViewControllerAnimated:YES];
}


#pragma mark - TabBarDelegate

- (void)didSelectedItem:(NSInteger)itemID
{
    WLNavigationControlller *w = [[WLDataManager instance].mainPagesArray objectAtIndex:itemID];
    [UIApplication sharedApplication].keyWindow.rootViewController = w;
}



@end
