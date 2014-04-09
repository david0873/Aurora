//
//  DFMGOrderListController.m
//  Aurora
//
//  Created by David on 14-4-4.
//  Copyright (c) 2014年 david. All rights reserved.
//

#import "DFMGOrderListController.h"
#import "DFuserOrder.h"
#import "DFOderDealController.h"

@interface DFMGOrderListController ()
@end

@implementation DFMGOrderListController

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
    
    NSArray* myPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString* myDocPath = [myPaths objectAtIndex:0];
    path = [myDocPath stringByAppendingPathComponent:@"order.plist"];
    
    self.psOders = [NSKeyedUnarchiver unarchiveObjectWithFile: path];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm"];
    
//    _psOders = [NSMutableArray arrayWithCapacity:8];
//    
//    DFUserOrder * order1 = [DFUserOrder alloc];
//    DFUser * user1 = [DFUser alloc];
//    user1.nibName = @"david";
//    order1.user = user1;
//    order1.number = 3;
//    order1.seatType = @"卡座";
//    order1.shopName = @"商户1";
//    order1.orderId = @"2423424242";
//    order1.startTime = [dateFormatter dateFromString:@"2014-04-05 13:00"];
//    order1.endTime = [dateFormatter dateFromString:@"2014-04-05 16:00"];
//    [_psOders addObject:order1];
//    
//    DFUserOrder * order2 = [DFUserOrder alloc];
//    DFUser * user2 = [DFUser alloc];
//    user2.nibName = @"Jessy";
//    order2.user = user2;
//    order2.number = 4;
//    order2.seatType = @"散台";
//    order2.shopName = @"商户2";
//    order2.orderId = @"242344242";
//    order2.startTime = [dateFormatter dateFromString:@"2014-04-06 15:00"];
//    order2.endTime = [dateFormatter dateFromString:@"2014-04-06 17:00"];
//    [_psOders addObject:order2];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}

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
    return [_psOders count];
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"identifier_managerOrder" forIndexPath:indexPath];
    
    DFUserOrder * order = [_psOders objectAtIndex:indexPath.row];
    
    UILabel * nibName = (UILabel *)[cell viewWithTag:1];
    nibName.text = order.user.nibName;
    
    UILabel * orderInfo = (UILabel *)[cell viewWithTag:2];
    orderInfo.text = [NSString stringWithFormat:@"%d %@", order.number, order.seatType];
    
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
    destination.row = indexPath.row;
    
    if([destination respondsToSelector:@selector(setDelegate:)]){
        [destination setValue:self forKey:@"delegate"];
    }
    if ([destination respondsToSelector:@selector(setSelection:)]) {
        NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
        DFUserOrder* order = [_psOders objectAtIndex:indexPath.row];
        [destination setValue:order forKey:@"selection"];
    }

}

- (void)orderDealController:(DFOderDealController *)controller didUpdatePresident:(DFUserOrder *)president{
    [self.psOders replaceObjectAtIndex:controller.row withObject:president];
    [self.tableView reloadData];
    [NSKeyedArchiver archiveRootObject:self.psOders toFile:path];
}


- (IBAction)backPressed:(UIBarButtonItem *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
