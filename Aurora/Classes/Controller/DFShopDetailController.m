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
    
    EGOImageView* imageView = (EGOImageView *)_shopImage;
    imageView.imageURL = [NSURL URLWithString:_imageUrl];
    
    _labelWorkTime.text = _workTime;
    _labelAvgConsume.text = _avgConsume;
    _labelTEL.text = _tel;
    _labelAddress.text = _address;
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
    DFUser * loginUser = [DFGlobalVar sharedGlobalVar].user;
    if (loginUser != nil) {
        UINavigationController * destination = [segue destinationViewController];
        NSArray *viewControllers = destination.viewControllers;
        DFReserveController *reserveController = [viewControllers objectAtIndex:0];
        reserveController.shopName = _shopName;
    }
    
}

- (void)dealloc {
    [_shopImage release];
    [_labelWorkTime release];
    [_labelAddress release];
    [_labelAvgConsume release];
    [_labelTEL release];
    [super dealloc];
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
}
@end
