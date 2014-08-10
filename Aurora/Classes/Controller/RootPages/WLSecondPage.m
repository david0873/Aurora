//
//  WLSecondPage.m
//  Aurora
//
//  Created by liwang on 14-6-22.
//  Copyright (c) 2014年 david. All rights reserved.
//

#import "WLSecondPage.h"
#import "WLNavigationControlller.h"
#import "WLDataManager.h"

@interface WLSecondPage ()

@end

@implementation WLSecondPage

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)action2
{
    WLNavigationControlller *w = [[WLDataManager instance].mainPagesArray objectAtIndex:0];
    [UIApplication sharedApplication].keyWindow.rootViewController = w;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"凤飞飞";
    self.view.backgroundColor = [UIColor yellowColor];
    //self.navigationItem.leftBarButtonItem = nil;
    [self createTabBar];
    [self.tabBar selectItem:1];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(100, 200, 120, 50);
    [button addTarget:self action:@selector(action2) forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"返回" forState:UIControlStateNormal];
    [self.view addSubview:button];
    
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

@end
