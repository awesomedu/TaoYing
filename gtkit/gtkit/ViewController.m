//
//  ViewController.m
//  gtkit
//
//  Created by mac on 2019/1/11.
//  Copyright © 2019年 mac. All rights reserved.
//

#import "ViewController.h"
#import "GTProgressHud.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
}
- (IBAction)btnclick:(id)sender {
     [GTProgressHud gt_showInfoMessage:@"test"];
}


@end
