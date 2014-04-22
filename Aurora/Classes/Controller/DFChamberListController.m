//
//  DFChamberListController.m
//  Aurora
//
//  Created by David on 14-4-14.
//  Copyright (c) 2014年 david. All rights reserved.
//

#import "DFChamberListController.h"
#import "DFShopDetailController.h"
#import "EGOImageView.h"
#import "RateView.h"
#import "DFShop.h"
#import "SQRiskCursor.h"

@interface DFChamberListController ()
@property (strong, nonatomic) NSMutableArray *shops;
@end

@implementation DFChamberListController

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
    
    _shops = [[NSMutableArray alloc]initWithCapacity:5];
    
    NSString * sampleChamberImage = @"http://www.show160.com/user/upphoto/20079/200791317125698501.jpg";
    
    for (int i=0 ; i<5; i++) {
        DFShop * shop = [DFShop alloc];
        shop.shopImage = sampleChamberImage;
        shop.shopName = [NSString stringWithFormat:@"会所%d",i+1];
        shop.desc = @"商户的简要描述信息商户的简要描述信息商户的简要描述信息商户的简要描述信息商户的简要描述信息";
        shop.avgConsume = @"500";
        shop.address = @"上海市**区**路**号";
        shop.avgConsume = @"500元";
        shop.workTime = @"17:00-05:00";
        shop.hiDegree = 9;
        [_shops addObject:shop];
    }
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

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    DFShopDetailController *destination = segue.destinationViewController;
    
    if ([destination respondsToSelector:@selector(setShop:)]) {
        NSIndexPath *indexPath = [_tableView indexPathForCell:sender];
        DFShop* shop = [self.shops objectAtIndex:indexPath.row];
        [destination setValue:shop forKey:@"shop"];
    }
    
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
    DFShop *shop = [self.shops objectAtIndex:indexPath.row];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"shopItem"];
    
    // Configure the cell...
    
    EGOImageView* shopImage = (EGOImageView*) [cell viewWithTag:1];
    shopImage.imageURL = [NSURL URLWithString:shop.shopImage];
    
    UILabel* shopName = (UILabel *) [cell viewWithTag:2];
    shopName.text = shop.shopName;

    SQRiskCursor* hiDegree = (SQRiskCursor *) [cell viewWithTag:3];
    [hiDegree setValue:shop.hiDegree];
    hiDegree.enabled = false;
    
    UITextView* shopDesc = (UITextView *) [cell viewWithTag:4];
    shopDesc.contentInset = UIEdgeInsetsMake(1.0f, 1.0f, 1.0f, 1.0f);
    shopDesc.text = shop.desc;
    
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

@end
