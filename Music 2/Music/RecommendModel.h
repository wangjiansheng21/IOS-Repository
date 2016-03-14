//
//  RecommendModel.h
//  Music
//
//  Created by 王凯 on 16/3/14.
//  Copyright © 2016年 王凯. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RecommendModel : NSObject
@property(nonatomic,strong) NSString * listid;
@property(nonatomic,strong) NSString * pic;
@property(nonatomic,strong) NSString * listenum;
@property(nonatomic,strong) NSString * collectnum;
@property(nonatomic,strong) NSString * title;
@property(nonatomic,strong) NSString * tag;
@property(nonatomic,strong) NSString * type;

+(instancetype)recommendModelWithDict:(NSDictionary*)dict;

@end
