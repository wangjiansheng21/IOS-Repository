//
//  MessageModel.h
//  qq
//
//  Created by 王建生 on 16/3/13.
//  Copyright © 2016年 AppleUser. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MessageModel : NSObject
@property(nonatomic,copy)NSString *icon;
@property(nonatomic,copy)NSString *name;
@property(nonatomic,copy)NSString *messageStr;
@property(nonatomic,copy)NSString *date;
@property(nonatomic,assign)BOOL isMe;
+(instancetype)messageModelWithDic:(NSDictionary *)dic;
@end
