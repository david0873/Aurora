//
//  ViewController.m
//  ViewPagerTest
//
//  Created by flame_thupdi on 13-4-17.
//  Copyright (c) 2013年 flame_thupdi. All rights reserved.
//

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:0.0]

#import "ViewController.h"
#import "EGOImageView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"nav_trans_bg.png"] forBarMetrics:UIBarMetricsDefault];
    
    NSArray* images = [NSArray arrayWithObjects:[UIImage imageNamed:@"image1.jpg"], [UIImage imageNamed:@"image2.jpg"], [UIImage imageNamed:@"image3.jpg"], nil];
    
    NSMutableArray* views = [NSMutableArray arrayWithCapacity:3];

    EGOImageView* imageView = [[EGOImageView alloc] initWithPlaceholderImage:[UIImage imageNamed:@"image1.jpg"]];
    imageView.imageURL = [NSURL URLWithString:@"http://s1.it.itc.cn/a/data/attachment/forum/201307/07/164242l780ypt0h3l83w0w.png"];
    
    [views addObject:imageView];
    
    for (int i=0; i<images.count; i++) {
        [views addObject:[[UIImageView alloc] initWithImage:images[i]]];
    }
    
    CGSize screenSize = [[UIScreen mainScreen] bounds].size;
    
    _vp = [[ViewPager alloc]initWithFrame:CGRectMake(0, 0, screenSize.width, screenSize.height) andViews:views];
    _vp.delegate = self;
    
    [self.view addSubview:_vp];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)ViewPager:(ViewPager *)viewPager didSelectIndex:(NSInteger)index
{
    NSLog(@"目前选中的是第%d个",index);
}

- (void)ViewPager:(ViewPager *)viewPager clickContent:(NSInteger)index
{
    NSLog(@"you clicked %d, i get you", index);
//    NSString *destActionIdentifier = nil;
    NSString *destViewIdentifier= nil;
    switch (index) {
        case 0:
//            destActionIdentifier = @"shopView";
            destViewIdentifier = @"barList";
            break;
        case 1:
//            destActionIdentifier = @"featureView";
            destViewIdentifier = @"chamberList";
            break;
        case 2:
//            destActionIdentifier = @"aroundView";
            destViewIdentifier = @"ktvList";
            break;
        case 3:
            destViewIdentifier = @"user";
            
        default:
            break;
    }
    
    UIStoryboard *board = [UIStoryboard storyboardWithName:@"MainStoryboard_iPhone" bundle:nil];
    UIViewController *next = [board instantiateViewControllerWithIdentifier:destViewIdentifier];
    [self.navigationController pushViewController:next animated:YES];
//    [self performSegueWithIdentifier:destViewIdentifier sender:self];
    
}

@end
