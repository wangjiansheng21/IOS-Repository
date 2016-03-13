//
//  Message.m
//  气泡聊天
//
//  Created by 王建生 on 16/3/3.
//  Copyright © 2016年 王建生. All rights reserved.
//

#import "Message.h"

@implementation Message
-(void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.messageStr forKey:@"messageStr"];
    [aCoder encodeObject:self.dateStr forKey:@"dateStr"];
    [aCoder encodeBool:self.isMe forKey:@"isMe"];
}
-(instancetype)initWithCoder:(NSCoder *)aDecoder{
//    Message *message=[Message new];
    if(self=[super init]){
        self.messageStr=[aDecoder decodeObjectForKey:@"messageStr"];
        self.dateStr=[aDecoder decodeObjectForKey:@"dateStr"];
        self.isMe=[aDecoder decodeBoolForKey:@"isMe"];

    }
//    message.messageStr=[aDecoder decodeObjectForKey:@"messageStr"];
//    message.dateStr=[aDecoder decodeObjectForKey:@"dateStr"];
//   message.isMe= [aDecoder decodeBoolForKey:@"isMe"];
    return self;
}
-(NSString *)description{
    return [NSString stringWithFormat:@"message:%@ date:%@",self.messageStr,self.dateStr];
}
@end
