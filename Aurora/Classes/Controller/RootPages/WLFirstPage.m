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
#import "WLSecondPage.h"


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



- (void)action2
{
    WLNavigationControlller *w = [[WLDataManager instance].mainPagesArray objectAtIndex:0];
    [UIApplication sharedApplication].keyWindow.rootViewController = w;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"Aurora";
    self.view.backgroundColor = [UIColor redColor];
    self.navigationItem.leftBarButtonItem = nil;
    [self.tabBar selectItem:0];
    
    [self createColletionModels];
    [self addCollections];
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
    __block WLFirstPage *weakSelf = self;
    for (NSInteger i = 0; i<images.count; i++) {
        model = [[WLCollectionCellModel alloc] initWithImage:[UIImage imageNamed:[images objectAtIndex:i]] title:[titles objectAtIndex:i] action:^{[weakSelf collectionAction];} aId:i];
        [_collections addObject:model];
    }
    
}

- (void)addCollections
{
    WLCollectionView *collections = [[WLCollectionView alloc] initWithOrigin:CGPointMake(0, 0)];
    [self.contentScrollView addSubview:collections];
    
    for (NSInteger i = 0; i<_collections.count; i++) {
        WLCollectionCellModel *model = [_collections objectAtIndex:i];        
        [collections addCellByModel:model];
    }
    
}

- (void)collectionAction
{
    UIViewController *controller = (UIViewController *)
    [[WLDataManager instance].mainStoryboard instantiateViewControllerWithIdentifier:@"rootView"];
    [self.navigationController pushViewController:controller animated:YES];
}

@end
