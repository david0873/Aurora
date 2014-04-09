//
//  DFPSOrderListController.m
//  Aurora
//
//  Created by David on 14-4-4.
//  Copyright (c) 2014年 david. All rights reserved.
//

#import "DFPSOrderListController.h"
#import "DFuserOrder.h"

@interface DFPSOrderListController ()
@property (nonatomic, strong) NSMutableArray *psOders;
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
    
    self.psOders = [NSKeyedUnarchiver unarchiveObjectWithFile: path];
    
//    _psOders = [NSMutableArray arrayWithCapacity:8];
//    
//    DFUserOrder * order1 = [DFUserOrder alloc];
//    order1.shopName = @"商户1";
//    order1.orderId = @"2423424242";
//    order1.agree = YES;
//
//    [_psOders addObject:order1];
//    
//    DFUserOrder * order2 = [DFUserOrder alloc];
//    order2.shopName = @"商户2";
//    order2.orderId = @"2423424242";
//    order2.agree = NO;
//    
//    [_psOders addObject:order2];
//    
//    DFUserOrder * order3 = [DFUserOrder alloc];
//    order3.shopName = @"商户3";
//    order3.orderId = @"2423424242";
//    order3.agree = YES;
//    
//    [_psOders addObject:order3];
//    
//    DFUserOrder * order4 = [DFUserOrder alloc];
//    order4.shopName = @"商户4";
//    order4.orderId = @"2423424242";
//    order4.agree = YES;
//    
//    [_psOders addObject:order4];
    
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
    return self.psOders.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"identifier_PersonalOrder" forIndexPath:indexPath];
    
    // Configure the cell...
    DFUserOrder * order = [self.psOders objectAtIndex:indexPath.row];
    
    UILabel * shopName = (UILabel *)[cell viewWithTag:1];
    shopName.text = order.shopName;
    
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
        
        [self.psOders removeObjectAtIndex:indexPath.row];
        [NSKeyedArchiver archiveRootObject:self.psOders toFile:path];
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath]
                         withRowAnimation:UITableViewRowAnimationAutomatic];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}



// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
    id object = [self.psOders objectAtIndex:fromIndexPath.row];
    [self.psOders removeObjectAtIndex:fromIndexPath.row];
    [self.psOders insertObject:object atIndex:toIndexPath.row];
    [NSKeyedArchiver archiveRootObject:self.psOders toFile:path];
}


// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
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

@end
