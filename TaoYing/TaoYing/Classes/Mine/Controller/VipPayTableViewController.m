//
//  VipPayTableViewController.m
//  TaoYing
//
//  Created by 唐都 on 2019/1/10.
//  Copyright © 2019 mac. All rights reserved.
//

#import "VipPayTableViewController.h"

@interface VipPayTableViewController ()
@property (weak, nonatomic) IBOutlet UIButton *wechatBtn;
@property (weak, nonatomic) IBOutlet UIButton *alipayBtn;
@property (weak, nonatomic) IBOutlet UIButton *agreeBtn;

@end

@implementation VipPayTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.titleString = @"支付";
    self.tableView.allowsSelection = NO;
}

- (IBAction)wechatClick:(UIButton *)sender {
    sender.selected = !sender.selected;
}

- (IBAction)alipayClick:(UIButton *)sender {
    sender.selected = !sender.selected;
}

- (IBAction)agreeClick:(UIButton *)sender {
    sender.selected = !sender.selected;
}



/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
