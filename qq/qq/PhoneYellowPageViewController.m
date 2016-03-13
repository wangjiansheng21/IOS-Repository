//
//  PhoneYellowPageViewController.m
//  qq
//
//  Created by 王建生 on 16/3/13.
//  Copyright © 2016年 AppleUser. All rights reserved.
//

#import "PhoneYellowPageViewController.h"

@interface PhoneYellowPageViewController ()

@end

@implementation PhoneYellowPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [super initViews];
    [self initViews];
    // Do any additional setup after loading the view from its nib.
}
-(void)initViews{
//    self.title=@"电话黄页";
//    self.navigationItem.title=@"电话黄页";
    UILabel *label=[UILabel new];
    label.frame=CGRectMake(0, 0, 80, 50);
    label.text=@"电话黄页";
    label.textColor=[UIColor whiteColor];
    self.navigationItem.titleView=label;
    UIButton *btn=[UIButton new];
    btn.frame=CGRectMake(0, 0, 50, 50);
    [btn setTitle:@"<电话" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(backAction) forControlEvents:  UIControlEventTouchUpInside ];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc] initWithCustomView:btn];
    UIButton *btnRight=[UIButton new];
    btnRight.frame=CGRectMake(0, 0, 100, 50);
    [btnRight setTitle:@"最近拨打" forState:UIControlStateNormal];
    [btnRight addTarget:self action:@selector(btnRightclickAction:) forControlEvents:  UIControlEventTouchUpInside ];
    [btnRight setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc] initWithCustomView:btnRight];

    
    self.tabBarController.tabBar.hidden=YES;
}
-(void)backAction{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)btnRightclickAction:(UIBarButtonItem *)sender{
    
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
