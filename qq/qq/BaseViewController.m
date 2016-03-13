//
//  BaseViewController.m
//  qq
//
//  Created by 王建生 on 16/3/13.
//  Copyright © 2016年 AppleUser. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)initViews{
    //    修改导航条颜色
    self.navigationController.navigationBar.barTintColor=[UIColor colorWithRed:0.1 green:0.1 blue:0.9 alpha:1];
    //    修改导航条上各子控件颜色
    self.navigationController.navigationBar.tintColor=[UIColor whiteColor];
    //   修改状态栏样式，必须修改info.plist文件View controller-based status bar appearance 改为no
    [UIApplication sharedApplication].statusBarStyle=UIStatusBarStyleLightContent;
    
    
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
