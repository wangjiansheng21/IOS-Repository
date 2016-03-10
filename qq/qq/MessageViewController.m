//
//  MessageViewController.m
//  qq
//
//  Created by AppleUser on 16/3/10.
//  Copyright © 2016年 AppleUser. All rights reserved.
//

#import "MessageViewController.h"
#import "ScanViewController.h"
#import "AddFriendViewController.h"
#import "CreateTalkGroupViewController.h"
#import "SendToComputerViewController.h"
#import "FaceToFaceFastTransformViewController.h"
#import "CollectMoneyViewController.h"
#import "AddView.h"
#define  APPW [UIScreen mainScreen].bounds.size.width
#define APPH [UIScreen mainScreen].bounds.size.height
#define WIDTH 150
#define HEIGHT 250
@interface MessageViewController ()<AddViewDelegate>
@property(nonatomic,strong)AddView *addView;
@property(nonatomic,strong)NSArray *controllers;

@end

@implementation MessageViewController{
    BOOL isFirstClick;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self initViews];
    // Do any additional setup after loading the view.
}
-(NSArray *)controllers{
    if(_controllers==nil){
        
        _controllers=@[
                       [ScanViewController new],
                       [AddFriendViewController new],
                       [CreateTalkGroupViewController new],
                       [SendToComputerViewController new],
                       [FaceToFaceFastTransformViewController new],
                       [CollectMoneyViewController new]
                       ];
    }
    return _controllers;
}
-(AddView *)addView{
     isFirstClick=NO;
    if(_addView==nil){
        isFirstClick=YES;
        _addView=[[AddView alloc] init];
        _addView.delegate=self;
        [self.view insertSubview:_addView aboveSubview:self.tableView];
        _addView.frame=CGRectMake(APPW-WIDTH-8,8,WIDTH, HEIGHT);
        
    }
   
    return _addView;
}
-(void)initViews{
    self.navigationController.navigationBar.backgroundColor=[UIColor blueColor];
  
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)addAction:(UIBarButtonItem *)sender {
   
    if(self.addView&&isFirstClick){
        return;
    }
    self.addView.hidden=!self.addView.hidden;
    
    
   
    
    
}
-(void)toAnother:(NSInteger)index{
    self.addView.hidden=YES;
      [self.navigationController pushViewController:self.controllers[index] animated:YES ];
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
