//
//  MyCell.h
//  气泡聊天
//
//  Created by 王建生 on 16/3/3.
//  Copyright © 2016年 王建生. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Message.h"
@interface MyCell : UITableViewCell
@property(nonatomic,strong) Message *message;
@end
