//
//  ScanViewController.m
//  qq
//
//  Created by 王建生 on 16/3/10.
//  Copyright © 2016年 AppleUser. All rights reserved.
//

#import "ScanViewController.h"

@interface ScanViewController ()

@end

@implementation ScanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"扫一扫";
    self.view.backgroundColor=[UIColor redColor];
    self.tabBarController.tabBar.hidden=YES;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
