//
//  WLRootViewController.m
//  Aurora
//
//  Created by liwang on 14-6-22.
//  Copyright (c) 2014年 david. All rights reserved.
//

#import "WLRootViewController.h"
#import "WLUtils.h"
#import "WLNavigationControlller.h"
#import "WLFirstPage.h"
#import "WLSecondPage.h"
#import "WLThirdPage.h"
#import "WLFourthPage.h"



@interface WLRootViewController ()

- (void)addPages;


@end

@implementation WLRootViewController

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
    self.title = @"详情";
    self.view.backgroundColor = [UIColor whiteColor];
    
    
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

#pragma mark - AddPages

- (void)addPages
{
    
    WLFirstPage *page = [[WLFirstPage alloc] init];
    WLNavigationControlller *page1 = [[WLNavigationControlller alloc] initWithRootViewController:page];
    [self.view addSubview:page1.view];
    
    WLNavigationControlller *page2 = [[WLNavigationControlller alloc] initWithRootViewController:[[WLSecondPage alloc] init]];
    [self.view addSubview:page2.view];
    
    WLNavigationControlller *page3 = [[WLNavigationControlller alloc] initWithRootViewController:[[WLThirdPage alloc] init]];
    [self.view addSubview:page3.view];
    
    WLNavigationControlller *page4 = [[WLNavigationControlller alloc] initWithRootViewController:[[WLFourthPage alloc] init]];
    [self.view addSubview:page4.view];
    
    [self.view bringSubviewToFront:page1.view];
    
}



@end
