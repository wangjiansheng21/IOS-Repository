//
//  MyModel.h
//  Calculator
//
//  Created by baiheng on 16/3/8.
//  Copyright © 2016年 baiheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyModel : NSObject

{
//    double accumulator;//累加器
    double opr;//操作数
    char op;//操作符
    
}
@property(nonatomic,assign)CGFloat accumulator;
@property(nonatomic,assign)CGFloat height;
@property(nonatomic,assign)BOOL isPressEqual;
-(void) setModel:(char)c;
-(NSString *)getModel;



@end
