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
    _labelComment.text = selection.addition;
    
    _textDeposit.delegate = self;
    _textMinConsume.delegate = self;
    
    _textMinConsume.text = [NSString stringWithFormat:@"%d", selection.miniCharge];
    _textDeposit.text = [NSString stringWithFormat:@"%d", selection.deposit];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

//- (void)viewWillDisappear:(BOOL)animated {
//    [super viewWillDisappear:animated];
//    
//    if ([self.delegate respondsToSelector:@selector(setEditedSelection:)]) {
//        // finish editing
//        [self.textView endEditing:YES];
//        // prepare selection info
//        NSIndexPath *indexPath = self.selection[@"indexPath"];
//        id object = self.textView.text;
//        NSDictionary *editedSelection = @{@"indexPath" : indexPath,
//                                          @"object" : object};
//        [self.delegate setValue:editedSelection forKey:@"editedSelection"];
//    }
//}


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

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return NO;
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
    self.selection.orderStatus = OrderNotPayed;
    self.selection.miniCharge = [_textMinConsume.text intValue];
    self.selection.deposit = [_textDeposit.text intValue];
    self.selection.addition = _labelComment.text;
    [self.delegate orderDealController:self didUpdateOrder:self.selection];
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)rejectPressed:(UIButton *)sender {
    self.selection.addition = _labelComment.text;
    self.selection.orderStatus = OrderFail;
    self.selection.miniCharge = [_textMinConsume.text intValue];
    self.selection.deposit = [_textDeposit.text intValue];
    self.selection.addition = _labelComment.text;
    [self.delegate orderDealController:self didUpdateOrder:self.selection];
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)backPressed:(UIBarButtonItem *)sender {
     [self dismissViewControllerAnimated:YES completion:nil];
}
@end
