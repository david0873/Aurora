//
//  DFMGHistoryShopListController.m
//  Aurora
//
//  Created by David on 14-6-25.
//  Copyright (c) 2014年 david. All rights reserved.
//

#import "DFMGHistoryShopListController.h"
#import "DFUserOrder.h"
#import "DFMGHistoryOrderListController.h"

@interface DFMGHistoryShopListController ()

@end


NSString *path;
NSMutableArray *shopNames;

@implementation DFMGHistoryShopListController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    NSArray* myPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString* myDocPath = [myPaths objectAtIndex:0];
    path = [myDocPath stringByAppendingPathComponent:@"order.plist"];
    
    self.psOrders = [NSKeyedUnarchiver unarchiveObjectWithFile: path];
    
    shopNames = [[NSMutableArray alloc]init];
    for (int i=0; i<self.psOrders.count; i++) {
        DFUserOrder * userOrder = [self.psOrders objectAtIndex:i];
        NSString * shopName = userOrder.shopName;
        if (![shopNames containsObject:shopName]&&userOrder.orderStatus!=0) {
            [shopNames addObject:shopName];
        }
    }
    
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [self.psOrders removeAllObjects];
    self.psOrders = [NSKeyedUnarchiver unarchiveObjectWithFile: path];
    
    [shopNames removeAllObjects];
    for (int i=0; i<self.psOrders.count; i++) {
        DFUserOrder * userOrder = [self.psOrders objectAtIndex:i];
        NSString * shopName = userOrder.shopName;
        if (![shopNames containsObject:shopName]&&userOrder.orderStatus!=0) {
            [shopNames addObject:shopName];
        }
    }
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return shopNames.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"shopCell" forIndexPath:indexPath];
    
    UILabel * shopName = (UILabel *) [cell viewWithTag:1];
    shopName.text = [shopNames objectAtIndex:indexPath.row];
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    DFMGHistoryOrderListController * destination = [segue destinationViewController];
    
    if ([destination respondsToSelector:@selector(setShopName:)]) {
        NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
        NSString* shopName = [shopNames objectAtIndex:indexPath.row];
        [destination setValue:shopName forKey:@"shopName"];
    }
}


@end
