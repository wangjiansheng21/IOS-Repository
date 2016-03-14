//
//  MyTabBarController.m
//  Music
//
//  Created by 王凯 on 16/3/12.
//  Copyright © 2016年 王凯. All rights reserved.
//

#import "MyTabBarController.h"
#import "MainVC.h"
#import "RankingVC.h"
#import "ClassVC.h"
#import "MyVC.h"
@interface MyTabBarController ()<UITabBarControllerDelegate>

@end

@implementation MyTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    //创建听觉盛宴
    MainVC *mainVC=[[MainVC alloc]init];
    UINavigationController *mainNavc=[[UINavigationController alloc]initWithRootViewController:mainVC];
    //Tabbar上对应的标题
    mainNavc.tabBarItem.title =@"听觉盛宴";
    //Tabbar上对应的图标
    mainNavc.tabBarItem.image=[UIImage imageNamed:@"cm2_note_icn_listen@2x"];
    
    //创建音乐排行
    RankingVC *rankingVC=[[RankingVC alloc]init];
    UINavigationController *rankingNavc=[[UINavigationController alloc]initWithRootViewController:rankingVC];
    
    rankingNavc.tabBarItem.title =@"音乐排行";
    rankingNavc.tabBarItem.image=[UIImage imageNamed:@"cm2_note_icn_logo@2x"];
    
    //创建分类享听
    ClassVC *classVC=[[ClassVC alloc]init];
    UINavigationController *classNavc=[[UINavigationController alloc]initWithRootViewController:classVC];
    
    classNavc.tabBarItem.title =@"分类享听";
    classNavc.tabBarItem.image=[UIImage imageNamed:@"cm2_btm_icn_music_prs@2x"];
    
    //创建我的音乐
    MyVC *myVC=[[MyVC alloc]init];
    UINavigationController *myNavc=[[UINavigationController alloc]initWithRootViewController:myVC];
    
    myNavc.tabBarItem.title =@"我的音乐";
    myNavc.tabBarItem.image=[UIImage imageNamed:@"ic_radiopage_personal@2x"];
    
    //更改Tabbar选中的图标颜色
    self.tabBar.tintColor=[UIColor blueColor];
    //Tabbar的填充色
    self.tabBar.barTintColor=[UIColor whiteColor];
    //将四个控制器放到Tabbar控制器这个容器里面
    self.viewControllers=@[mainNavc,rankingNavc,classNavc,myNavc];
    //设置代理，准备在代理方法中添加动画
    self.delegate=self;
    
    
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {NSLog(@"ssss========");
    CATransition* animation = [CATransition animation];
    [animation setDuration:0.8f];
    [animation setType:@"rippleEffect"];
    [animation setSubtype:kCATransitionFromRight];
    [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut]];
    [self.view.layer addAnimation:animation forKey:@"switchView"];
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
