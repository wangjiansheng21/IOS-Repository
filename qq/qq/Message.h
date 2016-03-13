//
//  Message.h
//  气泡聊天
//
//  Created by 王建生 on 16/3/3.
//  Copyright © 2016年 王建生. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Message : NSObject<NSCoding>
@property(nonatomic,copy)NSString *messageStr;
@property(nonatomic,copy)NSString *dateStr;
@property(nonatomic,assign)BOOL isMe;
@property(nonatomic,assign,getter=isHidden)BOOL hidden;
@end
