//
//  FirstViewController.m
//  userDefault-偏好设置
//
//  Created by AppleUser on 16/3/8.
//  Copyright © 2016年 AppleUser. All rights reserved.
//

#import "FirstViewController.h"
#import "Constraints.h"
@interface FirstViewController ()
@property (weak, nonatomic) IBOutlet UILabel *labOffer;
@property (weak, nonatomic) IBOutlet UILabel *labCode;
@property (weak, nonatomic) IBOutlet UILabel *labRank;
@property (weak, nonatomic) IBOutlet UILabel *labEngine;
@property (weak, nonatomic) IBOutlet UILabel *labWrap;

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self refrashTextField];
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)refrashTextField{
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    self.labOffer.text=[defaults objectForKey:OFFICER];
    self.labRank.text=[defaults objectForKey:RANK];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
