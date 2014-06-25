//
//  DFMGHistroyOrderDetailController.m
//  Aurora
//
//  Created by David on 14-6-25.
//  Copyright (c) 2014年 david. All rights reserved.
//

#import "DFMGHistoryOrderDetailController.h"

@interface DFMGHistoryOrderDetailController ()

@end

@implementation DFMGHistoryOrderDetailController

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
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm"];
    
    _labelNumber.text = [NSString stringWithFormat:@"%d", _selection.number];
    
    _lableSeatType.text = _selection.seatType;
    
    _labelStartTime.text = [dateFormatter stringFromDate:_selection.startTime];
    
    _labelEndTime.text = [dateFormatter stringFromDate:_selection.endTime];
    
    _labelRemarks.text = _selection.remarks;
    
    _labelComment.layer.borderColor = UIColor.grayColor.CGColor;
    _labelComment.layer.borderWidth =1.0;
    _labelComment.layer.cornerRadius =5.0;
    _labelComment.text = _selection.addition;
    
    _textMinConsume.text = [NSString stringWithFormat:@"%d", _selection.miniCharge];
    _textDeposit.text = [NSString stringWithFormat:@"%d", _selection.deposit];
    
    switch (_selection.orderStatus) {
        case -1:
            _orderStatus.text = @"失败";
            break;
        case 0:
            _orderStatus.text = @"处理中";
            break;
        case 1:
            _orderStatus.text = @"待支付";
            break;
        case 2:
            _orderStatus.text = @"成功";
            break;
        default:
            break;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//#pragma mark - Table view data source
//
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
//{
//#warning Potentially incomplete method implementation.
//    // Return the number of sections.
//    return 0;
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
//{
//#warning Incomplete method implementation.
//    // Return the number of rows in the section.
//    return 0;
//}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

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
