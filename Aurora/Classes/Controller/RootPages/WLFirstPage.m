//
//  WLFirstPage.m
//  Aurora
//
//  Created by liwang on 14-6-22.
//  Copyright (c) 2014年 david. All rights reserved.
//

#import "WLFirstPage.h"
#import "WLRootViewController.h"
#import "DFRootTabBarController.h"
#import "WLCollectionView.h"
#import "WLCollectionCellModel.h"


@interface WLFirstPage ()
{
    NSMutableArray *_collections;
}

- (void)action;

- (void)createColletionModels;

- (void)addCollections;

- (void)collectionAction;

@end

@implementation WLFirstPage

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)action
{
    UIViewController *controller = (UIViewController *)
    [[WLDataManager instance].mainStoryboard instantiateViewControllerWithIdentifier:@"rootView"];
    [self.navigationController pushViewController:controller animated:YES];
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
    self.title = @"首页";
    self.view.backgroundColor = [UIColor redColor];
    [self.tabBar selectItem:0];
    
    [self createColletionModels];
    [self addCollections];
    
    
    
    
    return;
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(100, 100, 120, 50);
    [button addTarget:self action:@selector(action) forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"开始" forState:UIControlStateNormal];
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

- (void)createColletionModels
{
    _collections = [[NSMutableArray alloc] init];
    WLCollectionCellModel *model = nil;
    
    NSArray *images = @[@"icon_homepage_entertainmentCategory.png",
                        @"icon_homepage_foodCategory.png",
                        @"icon_homepage_hotelCategory",
                        @"icon_homepage_KTVCategory",
                        @"icon_homepage_masageCategory",
                        @"icon_homepage_movieCategory",
                        @"icon_homepage_dailyNewDealCategory.png" ,
                        @"icon_homepage_moreCategory"];
    NSArray *titles = @[@"酒吧",
                        @"餐厅",
                        @"酒店",
                        @"KTV",
                        @"足浴",
                        @"电影",
                        @"今日新单",
                        @"更多分类"];
    
    for (NSInteger i = 0; i<images.count; i++) {
        model = [[WLCollectionCellModel alloc] initWithImage:[UIImage imageNamed:[images objectAtIndex:i]] title:[titles objectAtIndex:i] action:nil id:i];
        [_collections addObject:model];
    }
    
    
}

- (void)addCollections
{
    WLCollectionView *collections = [[WLCollectionView alloc] initWithOrigin:CGPointMake(0, 10)];
    [self.view addSubview:collections];
    
    for (NSInteger i = 0; i<_collections.count; i++) {
        WLCollectionCellModel *model = [_collections objectAtIndex:i];
        WLCollectionCell *cell = [[WLCollectionCell alloc] initWithImage:model.cellImage title:model.cellTitle action:model.cellAction];
        [collections addCell:cell];
    }
    
}

@end
