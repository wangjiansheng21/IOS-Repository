//
//  AddModel.h
//  qq
//
//  Created by 王建生 on 16/3/10.
//  Copyright © 2016年 AppleUser. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AddModel : NSObject
@property(nonatomic,copy)NSString *icon;
@property(nonatomic,copy)NSString *title;

+(instancetype)addModelWithDict:(NSDictionary *)dic;
@end
