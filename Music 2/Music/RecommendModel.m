//
//  RecommendModel.m
//  Music
//
//  Created by 王凯 on 16/3/14.
//  Copyright © 2016年 王凯. All rights reserved.
//

#import "RecommendModel.h"

@implementation RecommendModel
+(instancetype)recommendModelWithDict:(NSDictionary *)dict{
    id rencommendSong=[[self alloc]init];
    [rencommendSong setValuesForKeysWithDictionary:dict];

    NSLog(@"%@",dict);
    return rencommendSong;
}
@end
