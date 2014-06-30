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
#import "DFCommentListController.h"
#import "DFMessage.h"

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
    EGOImageView *imagview = [[EGOImageView alloc]initWithFrame:CGRectMake(0, 65, 320, 230)];
    imagview.imageURL = [NSURL URLWithString: _shop.shopImage];
    [self.view addSubview:imagview];
    
    NSArray* myPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString* myDocPath = [myPaths objectAtIndex:0];
    NSString* path = [myDocPath stringByAppendingPathComponent:@"msg.plist"];
    
    NSMutableArray * array = [NSKeyedUnarchiver unarchiveObjectWithFile: path];
    
    NSMutableArray * views = [[NSMutableArray alloc]init];
    
    if (array != nil) {
        for (int i=0; i<array.count; i++) {
            UITextView *textView = [[UITextView alloc] init];
            textView.font = [UIFont systemFontOfSize:16];
            textView.editable = false;
            DFMessage * msg = [array objectAtIndex:i];
            textView.text = msg.message;
            [views addObject:textView];
        }
    }
    
    viewPager = [[ViewPager alloc]initWithFrame:CGRectMake(0, 65, 320, 230) andViews:views];
    viewPager.delegate = self;
    viewPager.alpha = 0.5;
    [self.view addSubview:viewPager];
   
    self.title = _shop.shopName;
    
    _labelWorkTime.text = _shop.workTime;
    _labelAvgConsume.text = [NSString stringWithFormat:@"%@ 元",_shop.avgConsume];
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
            reserveController.shop = _shop;
        }
    }else if ([segue.identifier isEqualToString:@"segueComment"]){
        DFUser * loginUser = [DFGlobalVar sharedGlobalVar].user;
        if (loginUser != nil) {
            UINavigationController * destination = [segue destinationViewController];
            NSArray *viewControllers = destination.viewControllers;
            DFCommentListController *commentController = [viewControllers objectAtIndex:0];
            commentController.shop = _shop;
        }
    }
    
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
