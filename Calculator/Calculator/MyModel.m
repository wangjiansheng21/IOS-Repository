//
//  MyModel.m
//  Calculator
//
//  Created by baiheng on 16/3/8.
//  Copyright © 2016年 baiheng. All rights reserved.
//

#import "MyModel.h"

@implementation MyModel

-(void)setModel:(char)c
{


    switch (c) {
            
        case 'C':
            opr = 0.0;
            self.accumulator = 0.0;
            
            break;
        case '+':; case '-':; case '*':; case '/':
            op = c;
            opr = self.accumulator;
            self.accumulator = 0.0;
            
            
            break;
            
        case '=':
            self.isPressEqual=YES;
            switch (op) {
                case '+':
                    self.accumulator = opr + self.accumulator;
                    break;
                case '-':
                    self.accumulator = opr -self.accumulator;
                    break;
                 
                case '*':
                    self.accumulator = opr * self.accumulator;
                    break;
                    
                case '/':
                    self.accumulator = opr / self.accumulator;
                    break;
                    
                default:
                    break;
            }
            
  
            break;
      
        default://输入字符为0.。9数字
            if(self.isPressEqual==YES){
                self.isPressEqual=NO;
                self.accumulator=0.0;
            }
           self.accumulator = self.accumulator * 10.0 + (c-'0');
            
            
            break;
    }
}


-(NSString *)getModel
{
    return [NSString stringWithFormat:@"%f",_accumulator];
    
}

-(instancetype) init
{
    self = [super init];
    _accumulator = 0.0;
    opr = 0.0;
    return self;
}



@end
