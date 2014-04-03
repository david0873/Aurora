//
//  DfShopListController.m
//  ViewPagerTest
//
//  Created by David on 14-3-15.
//  Copyright (c) 2014年 flame_thupdi. All rights reserved.
//

#import "DFShopListController.h"
#import "DFShopDetailController.h"
#import "EGOImageView.h"
#import "RateView.h"

@interface DFShopListController ()
@property (strong, nonatomic) NSArray *shops;
@end

@implementation DFShopListController

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
    _tableView.delegate = self;
    _tableView.dataSource = self;
        
    self.shops = @[@[@"http://e.hiphotos.baidu.com/image/w%3D2048/sign=d3d8ef75af345982c58ae29238cc31ad/f2deb48f8c5494eeb41a74182ff5e0fe99257ef2.jpg",@"商户1",@"商户的简要描述信息商户的简要描述信息商户的简要描述信息商户的简要描述信息商户的简要描述信息商户的简要描述信息"],
                   @[@"http://d.hiphotos.baidu.com/image/w%3D2048/sign=602bfe2d8501a18bf0eb154faa170608/42166d224f4a20a4addc44c692529822730ed0f5.jpg",@"商户2",@"商户的简要描述信息"],
                   @[@"http://e.hiphotos.baidu.com/image/w%3D2048/sign=03b1b4edd300baa1ba2c40bb7328b812/0e2442a7d933c8954dcfe17ad31373f082020079.jpg",@"商户3",@"商户的简要描述信息"],
                   @[@"http://h.hiphotos.baidu.com/image/w%3D2048/sign=b0deb35999504fc2a25fb705d1e5e611/d058ccbf6c81800a8628b65fb33533fa838b4795.jpg",@"商户4",@"商户的简要描述信息"],
                   @[@"http://e.hiphotos.baidu.com/image/w%3D2048/sign=49161ab24510b912bfc1f1fef7c5fc03/d043ad4bd11373f006053296a60f4bfbfbed0484.jpg",@"商户5",@"商户的简要描述信息"],
                   @[@"http://a.hiphotos.baidu.com/image/w%3D2048/sign=a27c0e276f224f4a579974133dcf9152/3bf33a87e950352ad6db5d095143fbf2b2118b7c.jpg",@"商户6",@"商户的简要描述信息"],
                   @[@"http://f.hiphotos.baidu.com/image/w%3D2048/sign=446decb7cb177f3e1034fb0d44f73ac7/aa18972bd40735fa736830b89c510fb30f240812.jpg",@"商户7",@"商户的简要描述信息"]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) viewDidAppear:(BOOL)animated{
   
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    DFShopDetailController *destination = segue.destinationViewController;
    destination.imageUrl = @"http://www.show160.com/user/upphoto/20079/200791317125698501.jpg";
    destination.workTime = @"17:00-05:00";
    destination.avgConsume = @"500元";
    destination.address = @"上海市**区**路**号";
    destination.tel = @"021-88888888";
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.shops count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSArray *shopItem = [self.shops objectAtIndex:indexPath.row];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"shopItem"];
    
    // Configure the cell...
    
    EGOImageView* shopImage = (EGOImageView*) [cell viewWithTag:1];
    shopImage.imageURL = [NSURL URLWithString:[shopItem objectAtIndex:0]];
    
    UILabel* shopName = (UILabel *) [cell viewWithTag:2];
    shopName.text = [shopItem objectAtIndex:1];
    
    RateView* rateView = (RateView *) [cell viewWithTag:3];
    rateView.notSelectedImage = [UIImage imageNamed:@"star_empty"];
    rateView.halfSelectedImage = [UIImage imageNamed:@"star_half"];
    rateView.fullSelectedImage = [UIImage imageNamed:@"star_full"];
    rateView.rating = 3.5;
    rateView.editable = FALSE;
    rateView.maxRating = 5;
    
    UITextView* shopDesc = (UITextView *) [cell viewWithTag:4];
    shopDesc.contentInset = UIEdgeInsetsMake(1.0f, 1.0f, 1.0f, 1.0f);
    shopDesc.text = [shopItem objectAtIndex:2];
    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

- (void)dealloc {
    [_tableView release];
    [super dealloc];
}
- (IBAction)homePressed:(UIBarButtonItem *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
