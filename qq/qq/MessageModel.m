//
//  MessageModel.m
//  qq
//
//  Created by 王建生 on 16/3/13.
//  Copyright © 2016年 AppleUser. All rights reserved.
//

#import "MessageModel.h"

@implementation MessageModel
+(instancetype)messageModelWithDic:(NSDictionary *)dic{
    MessageModel *model=[MessageModel new];
    if(model){
        [model setValuesForKeysWithDictionary:dic];
    }
    return model;
}
@end
