//
//  ViewController.m
//  Calculator
//
//  Created by baiheng on 16/3/8.
//  Copyright © 2016年 baiheng. All rights reserved.
//

#import "ViewController.h"
#import "MyModel.h"


@interface ViewController ()
@property(nonatomic,strong)
MyModel *myModel;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //模型初始化
    _myModel = [[MyModel alloc]init];
//    添加观察者--1被观察对象必须是属性 2该属性值得修改必须用set语法
#if 0 
    [self.myModel addObserver:self forKeyPath:@"accumulator" options:NSKeyValueObservingOptionOld|NSKeyValueObservingOptionNew context:nil];
#endif
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(show:) name:@"changeNotification" object:nil];
}
-(void)show:(NSNotification *)notifi{
    CGFloat res=[[notifi.userInfo objectForKey:@"accumulator"] floatValue];
//    if(res==0){
//        _myView.text=@"";
//        return;
//    }
    
    _myView.text= [[notifi.userInfo objectForKey:@"accumulator"] description];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#if 0
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
    NSLog(@"---");
    
    _myView.text=[[change valueForKey:@"new"] stringValue];

}
#endif
- (IBAction)run:(id)sender {
    

    UIButton * uiButton = (UIButton *)sender;
    NSString * title = uiButton.currentTitle;
    
    [_myModel setModel:[title characterAtIndex:0]];
//    传值
    NSDictionary *dic=@{@"accumulator":@(self.myModel.accumulator),
                        @"title":[sender currentTitle]
                        };
    [[NSNotificationCenter defaultCenter]postNotificationName:@"changeNotification" object:nil userInfo:dic];
//    NSString * s = [myModel getModel];
//    
//    _myView.text = s;
    
    
    
    
}
@end

































