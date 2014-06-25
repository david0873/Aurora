//
//  WLNavigationControlller.m
//  Aurora
//
//  Created by liwang on 14-6-22.
//  Copyright (c) 2014年 david. All rights reserved.
//

#import "WLNavigationControlller.h"
#import "WLUtils.h"

@interface WLNavigationControlller ()
{
    UIButton *_button;
}
- (void)createNavigationBackItem;

@end

@implementation WLNavigationControlller

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
    self.navigationBar.translucent = NO;
    self.navigationBar.barTintColor = [WLUtils colorWithRed:46 green:182 blue:168];
    self.navigationBar.tintColor = [UIColor whiteColor];
    NSDictionary *dic = [NSDictionary dictionaryWithObject:[UIColor whiteColor] forKey:NSForegroundColorAttributeName];
    self.navigationBar.titleTextAttributes = dic;
    
    //[self createNavigationBackItem];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)createNavigationBackItem
{
    UIImage *normalImage = [UIImage imageNamed:@"ump_icon_back.png"];
    UIImage *highImage = [UIImage imageNamed:@"ump_icon_back_foucs.png"];
    _button = [UIButton buttonWithType:UIButtonTypeCustom];
    _button.frame = CGRectMake(-50, 0, normalImage.size.width/2, normalImage.size.height/2);
    [_button setImage:normalImage forState:UIControlStateNormal];
    [_button setImage:highImage forState:UIControlStateHighlighted];
    //[_button addTarget:self action:@selector(navigationBackUp) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:_button];
    
   
    self.navigationItem.leftBarButtonItem = backItem;
    _button.frame = CGRectMake(-50, 0, normalImage.size.width/2, normalImage.size.height/2);
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
