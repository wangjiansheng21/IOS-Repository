//
//  AddView.m
//  qq
//
//  Created by AppleUser on 16/3/10.
//  Copyright © 2016年 AppleUser. All rights reserved.
//

#import "AddView.h"

@implementation AddView
-(instancetype)init{
    if(self=[super init]){
        UITableView *tableView=[UITableView new];
        [self addSubview:tableView];
    }
    return self;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
