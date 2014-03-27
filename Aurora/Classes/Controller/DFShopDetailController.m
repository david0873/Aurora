//
//  FirstViewController.m
//  ViewPagerTest
//
//  Created by David on 14-3-13.
//  Copyright (c) 2014年 flame_thupdi. All rights reserved.
//

#import "DFShopDetailController.h"
#import "EGOImageView.h"

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
    
}

- (IBAction)homePressed:(UIBarButtonItem *)sender {
    NSLog(@"home pressed");
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)reservePressed:(UIButton *)sender {
    NSLog(@"resere pressed");
}

- (IBAction)commentPressed:(UIButton *)sender {
    NSLog(@"comment pressed");
}
- (void)dealloc {
    [_shopImage release];
    [_labelWorkTime release];
    [_labelAddress release];
    [_labelAvgConsume release];
    [_labelTEL release];
    [super dealloc];
}
@end
