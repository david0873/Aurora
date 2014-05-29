//
//  FirstViewController.m
//  ViewPagerTest
//
//  Created by David on 14-3-13.
//  Copyright (c) 2014年 flame_thupdi. All rights reserved.
//

#import "DFShopDetailController.h"
#import "EGOImageView.h"
#import "DFReserveController.h"
#import "DFGlobalVar.h"

@interface DFShopDetailController ()

@end

@implementation DFShopDetailController

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
    UITextView *textView1 = [[[UITextView alloc] init] autorelease];
    textView1.editable = false;
    textView1.text = @"促销活动";
    
    UITextView *textView2 = [[[UITextView alloc] init] autorelease];
    textView2.font = [UIFont systemFontOfSize:16];
    textView2.editable = false;
    textView2.text = @"购买早午餐菜单中任意两份特色早午餐, 汉堡或意面, 即可获赠小蓝蛙菜单中主菜及软饮一份. \n蓝蛙正大广场店开业慈善派对\n2014年4月18日\n下午6点半至闭店\n购买早午餐菜单中任意两份特色早午餐, 汉堡或意面, 即可获赠小蓝蛙菜单中主菜及软饮一份. \n蓝蛙正大广场店开业慈善派对\n2014年4月18日\n下午6点半至闭店";

    NSArray * views = [NSArray arrayWithObjects:textView1, textView2, nil];
    
    viewPager = [[ViewPager alloc]initWithFrame:CGRectMake(0, 65, 320, 230) andViews:views];
    viewPager.delegate = self;
    [self.view addSubview:viewPager];
   
    
    _labelWorkTime.text = [NSString stringWithFormat:@"%@-%@",_shop.workStartTime, _shop.workEndTime];
    _labelAvgConsume.text = _shop.avgConsume;
    _labelAddress.text = _shop.address;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([segue.identifier isEqualToString:@"segueReserve"]) {
        DFUser * loginUser = [DFGlobalVar sharedGlobalVar].user;
        if (loginUser != nil) {
            UINavigationController * destination = [segue destinationViewController];
            NSArray *viewControllers = destination.viewControllers;
            DFReserveController *reserveController = [viewControllers objectAtIndex:0];
            reserveController.shopName = _shop.shopName;
        }
    }
    
}

- (void)dealloc {
    [_labelWorkTime release];
    [_labelAddress release];
    [_labelAvgConsume release];
    [super dealloc];
}

- (void)ViewPager:(ViewPager *)viewPager clickContent:(NSInteger)index{
    
}

- (void)ViewPager:(ViewPager *)viewPager didSelectIndex:(NSInteger)index
{
    
}


- (IBAction)reservePressed:(UIButton *)sender {
    DFUser * loginUser = [DFGlobalVar sharedGlobalVar].user;
    if (loginUser == nil) {
        NSString * segueIdentifier = @"segueLogin";
        [self performSegueWithIdentifier:segueIdentifier sender:self];
    }else{
        NSString * segueIdentifier = @"segueReserve";
        [self performSegueWithIdentifier:segueIdentifier sender:self];
    }
}

- (IBAction)commentPressed:(UIButton *)sender {
    NSString * segueIdentifier = @"segueComment";
    [self performSegueWithIdentifier:segueIdentifier sender:self];
}
@end
