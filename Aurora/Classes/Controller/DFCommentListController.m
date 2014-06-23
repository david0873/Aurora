//
//  DFCommentListController.m
//  Aurora
//
//  Created by David on 14-4-18.
//  Copyright (c) 2014年 david. All rights reserved.
//

#import "DFCommentListController.h"
#import "DFUser.h"
#import "DFGlobalVar.h"
#import "YBAddCommentController.h"
#import "DFComment.h"
#import "SQRiskCursor.h"

@interface DFCommentListController ()

@end

NSString * path;

@implementation DFCommentListController

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
    path = [myDocPath stringByAppendingPathComponent:@"comment.plist"];
    
    self.comments = [NSKeyedUnarchiver unarchiveObjectWithFile: path];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    return self.comments.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"commentIdentifier" forIndexPath:indexPath];
    
    DFComment * comment = [self.comments objectAtIndex:indexPath.row];
    
    UILabel * userName = (UILabel *)[cell viewWithTag:1];
    userName.text = comment.user.nibName;
    
    SQRiskCursor * hiDegree = (SQRiskCursor *)[cell viewWithTag:2];
    hiDegree.value = comment.hiDegree;
    hiDegree.enabled = NO;
    
    UITextView * content = (UITextView *)[cell viewWithTag:3];
    content.text = comment.content;
    
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)AddComment:(UIBarButtonItem *)sender {
    DFUser * loginUser = [DFGlobalVar sharedGlobalVar].user;
    if (loginUser == nil) {
        NSString * segueIdentifier = @"segueLogin";
        [self performSegueWithIdentifier:segueIdentifier sender:self];
    }else{
        NSString * segueIdentifier = @"segueCommentAdd";
        [self performSegueWithIdentifier:segueIdentifier sender:self];
    }
}

- (IBAction)backPressed:(UIBarButtonItem *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([segue.identifier isEqualToString:@"segueCommentAdd"]) {
        DFUser * loginUser = [DFGlobalVar sharedGlobalVar].user;
        if (loginUser != nil) {
            UINavigationController * destination = [segue destinationViewController];
            NSArray *viewControllers = destination.viewControllers;
            YBAddCommentController *commentController = [viewControllers objectAtIndex:0];
            commentController.shop = _shop;
        }
    }
    
}


@end
