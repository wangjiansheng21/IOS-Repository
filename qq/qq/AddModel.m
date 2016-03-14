//
//  AddModel.m
//  qq
//
//  Created by 王建生 on 16/3/10.
//  Copyright © 2016年 AppleUser. All rights reserved.
//

#import "AddModel.h"

@implementation AddModel
+(instancetype)addModelWithDict:(NSDictionary *)dic{
    AddModel *model=[AddModel new];
    if(model){
        [model setValuesForKeysWithDictionary:dic];
    }
    return model;
}
@end
