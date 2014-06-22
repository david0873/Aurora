//
//  DFPSOrderListController.m
//  Aurora
//
//  Created by David on 14-4-4.
//  Copyright (c) 2014年 david. All rights reserved.
//

#import "DFPSOrderListController.h"
#import "DFuserOrder.h"
#import "DFOrderDetailController.h"

@interface DFPSOrderListController ()
@property (nonatomic, strong) NSMutableArray *psOrders;
@end

@implementation DFPSOrderListController

NSString *path;

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
    
    // Uncomment the following line to preserve selection between presentations.
    self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
/*
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
    return self.psOrders.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"identifier_PersonalOrder" forIndexPath:indexPath];
    
    // Configure the cell...
    DFUserOrder * order = [self.psOrders objectAtIndex:indexPath.row];
    
//    UILabel * shopName = (UILabel *)[cell viewWithTag:1];
//    shopName.text = order.shopName;
    
    UILabel * orderId = (UILabel *)[cell viewWithTag:2];
    orderId.text = order.orderId;
    
    UILabel * orderStatusLabel = (UILabel *)[cell viewWithTag:3];
    switch (order.orderStatus) {
        case -1:
            orderStatusLabel.text = @"失败";
            break;
        case 0:
            orderStatusLabel.text = @"处理中";
            break;
        case 1:
            orderStatusLabel.text = @"成功";
            break;
        default:
            break;
    }
    
    return cell;
}

// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        
        [self.psOrders removeObjectAtIndex:indexPath.row];
        [NSKeyedArchiver archiveRootObject:self.psOrders toFile:path];
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath]
                         withRowAnimation:UITableViewRowAnimationAutomatic];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}



// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
    id object = [self.psOrders objectAtIndex:fromIndexPath.row];
    [self.psOrders removeObjectAtIndex:fromIndexPath.row];
    [self.psOrders insertObject:object atIndex:toIndexPath.row];
    [NSKeyedArchiver archiveRootObject:self.psOrders toFile:path];
}


// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    DFOrderDetailController *destination = segue.destinationViewController;
    
    if ([destination respondsToSelector:@selector(setSelection:)]) {
        NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
        DFUserOrder* userOrder = [self.psOrders objectAtIndex:indexPath.row];
        [destination setValue:userOrder forKey:@"selection"];
    }
}


@end
