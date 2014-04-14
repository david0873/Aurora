//
//  DFOderDealController.m
//  Aurora
//
//  Created by David on 14-4-8.
//  Copyright (c) 2014年 david. All rights reserved.
//

#import "DFOderDealController.h"

@interface DFOderDealController ()

@end

@implementation DFOderDealController
@synthesize selection;
@synthesize delegate;

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
    
    _labelNumber.text = [NSString stringWithFormat:@"%d", selection.number];
    
    _lableSeatType.text = selection.seatType;
    
    _labelStartTime.text = [dateFormatter stringFromDate:selection.startTime];
    
    _labelEndTime.text = [dateFormatter stringFromDate:selection.endTime];
    
    _labelRemarks.text = selection.remarks;
    
    _labelComment.layer.borderColor = UIColor.grayColor.CGColor;
    _labelComment.layer.borderWidth =1.0;
    _labelComment.layer.cornerRadius =5.0;
    _labelComment.delegate = self;
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if ([text isEqualToString:@"\n"])
    {
        [textView resignFirstResponder];
    }
    return YES;
}


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

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

- (IBAction)okPressed:(id)sender {
    self.selection.addition = _labelComment.text;
    self.selection.orderStatus = OrderSuccess;
    [self.delegate orderDealController:self didUpdatePresident:self.selection];
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)rejectPressed:(UIButton *)sender {
    self.selection.addition = _labelComment.text;
    self.selection.orderStatus = OrderFail;
    [self.delegate orderDealController:self didUpdatePresident:self.selection];
    [self.navigationController popViewControllerAnimated:YES];
}
@end