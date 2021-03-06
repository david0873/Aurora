//
//  DFMGOrderListController.m
//  Aurora
//
//  Created by David on 14-4-4.
//  Copyright (c) 2014年 david. All rights reserved.
//

#import "DFMGOrderDealListController.h"
#import "DFuserOrder.h"
#import "DFOderDealController.h"

@interface DFMGOrderDealListController ()
@end

@implementation DFMGOrderDealListController

NSString *path;
NSMutableArray * filteredOrders;
NSMutableArray * filteredOrderIndexes;

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
    
    NSArray* myPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString* myDocPath = [myPaths objectAtIndex:0];
    path = [myDocPath stringByAppendingPathComponent:@"order.plist"];
    
    self.psOrders = [NSKeyedUnarchiver unarchiveObjectWithFile: path];
    
    filteredOrders = [[NSMutableArray alloc]init];
    filteredOrderIndexes = [[NSMutableArray alloc]init];
    
    for (int i=0; i<self.psOrders.count; i++) {
        DFUserOrder * userOrder = [self.psOrders objectAtIndex:i];
        NSString * tempShopName = userOrder.shopName;
        if ([self.shopName isEqualToString:tempShopName]&&userOrder.orderStatus==0) {
            [filteredOrders addObject:userOrder];
            [filteredOrderIndexes addObject:[NSNumber numberWithInt:i]];
        }
    }
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;

}

- (void)viewWillAppear:(BOOL)animated{
    [self.psOrders removeAllObjects];
    self.psOrders = [NSKeyedUnarchiver unarchiveObjectWithFile: path];
    
    [filteredOrders removeAllObjects];
    [filteredOrderIndexes removeAllObjects];
    
    for (int i=0; i<self.psOrders.count; i++) {
        DFUserOrder * userOrder = [self.psOrders objectAtIndex:i];
        NSString * tempShopName = userOrder.shopName;
        if ([self.shopName isEqualToString:tempShopName]&&userOrder.orderStatus==0) {
            [filteredOrders addObject:userOrder];
            [filteredOrderIndexes addObject:[NSNumber numberWithInt:i]];
        }
    }
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//- (void)viewWillAppear:(BOOL)animated{
//    [super viewWillAppear:animated];
//    [filteredOrderIndexes removeAllObjects];
//    
//    for (int i=0; i<self.psOrders.count; i++) {
//        DFUserOrder * userOrder = [self.psOrders objectAtIndex:i];
//        NSString * tempShopName = userOrder.shopName;
//        if ([self.shopName isEqualToString:tempShopName]&&userOrder.orderStatus==0) {
//            [filteredOrders addObject:userOrder];
//            [filteredOrderIndexes addObject:[NSNumber numberWithInt:i]];
//        }
//    }
//    [self.tableView reloadData];
//}

/*
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 0;
}
*/

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [filteredOrders count];
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"identifier_managerOrder" forIndexPath:indexPath];
    
    DFUserOrder * order = [filteredOrders objectAtIndex:indexPath.row];
    
    UILabel * nibName = (UILabel *)[cell viewWithTag:1];
    nibName.text = order.user.nibName;
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm"];
    UILabel * orderTime = (UILabel *)[cell viewWithTag:2];
    orderTime.text = [dateFormatter stringFromDate:order.orderTime];
    
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
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    DFOderDealController * destination = [segue destinationViewController];
    NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
    destination.row = [[filteredOrderIndexes objectAtIndex:indexPath.row] integerValue];
    
    if([destination respondsToSelector:@selector(setDelegate:)]){
        [destination setValue:self forKey:@"delegate"];
    }
    if ([destination respondsToSelector:@selector(setSelection:)]) {
        NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
        DFUserOrder* order = [filteredOrders objectAtIndex:indexPath.row];
        [destination setValue:order forKey:@"selection"];
    }

}

- (void)orderDealController:(DFOderDealController *)controller didUpdateOrder:(DFUserOrder *)order{
    [self.psOrders replaceObjectAtIndex:controller.row withObject:order];
    [NSKeyedArchiver archiveRootObject:self.psOrders toFile:path];
    
}


- (IBAction)backPressed:(UIBarButtonItem *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
