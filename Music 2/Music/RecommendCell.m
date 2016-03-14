//
//  RecommendCell.m
//  Music
//
//  Created by 王凯 on 16/3/14.
//  Copyright © 2016年 王凯. All rights reserved.
//
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
#import "RecommendCell.h"

@implementation RecommendCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        _recommendScroll=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 28, kScreenWidth, kScreenHeight/3.51)];
        [self.contentView addSubview:_recommendScroll];
        _recommendScroll.contentSize=CGSizeMake(2*kScreenWidth, 0);
        
        //第一个圆button设置frame并将其设成圆的
        _firstBtn=[[UIButton alloc]initWithFrame:CGRectMake(kScreenWidth/25, 0, kScreenWidth/2.34, kScreenWidth/2.34)];
        [self.recommendScroll addSubview:_firstBtn];
        
        _firstBtn.layer.masksToBounds=YES;
        _firstBtn.layer.borderWidth=2;
        _firstBtn.layer.cornerRadius=self.firstBtn.frame.size.height/2;
        _firstBtn.layer.borderColor=[UIColor whiteColor].CGColor;
        
        // 第二个圆button设置frame并将其设成圆的
        _secondBtn=[[UIButton alloc]initWithFrame:CGRectMake(kScreenWidth/10+kScreenWidth/2.34, 0, kScreenWidth/2.34, kScreenWidth/2.34)];
        [self.recommendScroll addSubview:_secondBtn];
        _secondBtn.layer.masksToBounds=YES;
        _secondBtn.layer.borderWidth=2;
        _secondBtn.layer.cornerRadius=self.firstBtn.frame.size.height/2;
        _secondBtn.layer.borderColor=[UIColor whiteColor].CGColor;
        
        // 第三个圆button设置frame并将其设成圆的
        _thirdBtn=[[UIButton alloc]initWithFrame:CGRectMake(kScreenWidth/6+kScreenWidth/2.34*2, 0, kScreenWidth/2.34, kScreenWidth/2.34)];
        [self.recommendScroll addSubview:_thirdBtn];
        _thirdBtn.layer.masksToBounds=YES;
        _thirdBtn.layer.borderWidth=2;
        _thirdBtn.layer.cornerRadius=self.firstBtn.frame.size.height/2;
        _thirdBtn.layer.borderColor=[UIColor whiteColor].CGColor;
        
        //第四个圆button设置frame并将其设成圆的
        _fourthBtn=[[UIButton alloc]initWithFrame:CGRectMake(kScreenWidth/4+kScreenWidth/2.34*3, 0, kScreenWidth/2.34, kScreenWidth/2.34)];
        [self.recommendScroll addSubview:_fourthBtn];
        _fourthBtn.layer.masksToBounds=YES;
        _fourthBtn.layer.borderWidth=2;
        _fourthBtn.layer.cornerRadius=self.fourthBtn.frame.size.height/2;
        _fourthBtn.layer.borderColor=[UIColor whiteColor].CGColor;
        
        
        //第一个button下的标题label，设置字体颜色，字体大小，居中显示
        _firstLab=[[UILabel alloc]initWithFrame:CGRectMake(10, self.firstBtn.frame.size.height, self.firstBtn.frame.size.width, 30)];
        [self.recommendScroll addSubview:_firstLab];
        _firstLab.text=@"1111111";
        _firstLab.textAlignment=NSTextAlignmentCenter;
        _firstLab.textColor=[UIColor whiteColor];
        _firstLab.font=[UIFont systemFontOfSize:14];
        
        //第二个button下的标题label，设置字体颜色，字体大小，居中显示
        _secondLab=[[UILabel alloc]initWithFrame:CGRectMake(self.recommendScroll.frame.size.width*0.5+10, self.secondBtn.frame.size.height, self.secondBtn.frame.size.width, 30)];
        [self.recommendScroll addSubview:_secondLab];
        _secondLab.text=@"1111111";
        _secondLab.textAlignment=NSTextAlignmentCenter;
        _secondLab.textColor=[UIColor whiteColor];
        _secondLab.font=[UIFont systemFontOfSize:14];
        
        //第三个button下的标题label，设置字体颜色，字体大小，居中显示
        _thirdLab=[[UILabel alloc]initWithFrame:CGRectMake(2*self.recommendScroll.frame.size.width*0.5+10, self.thirdBtn.frame.size.height,self.thirdBtn.frame.size.width, 30)];
        [self.recommendScroll addSubview:_thirdLab];
        _thirdLab.textAlignment=NSTextAlignmentCenter;
        _thirdLab.text=@"111111";
        _thirdLab.textColor=[UIColor whiteColor];
        _thirdLab.font=[UIFont systemFontOfSize:14];
        
        //第四个button下的标题label，设置字体颜色，字体大小，居中显示
        _fourthLab=[[UILabel alloc]initWithFrame:CGRectMake(3*self.recommendScroll.frame.size.width*0.5+10, self.fourthBtn.frame.size.height, self.fourthBtn.frame.size.width, 30)];
        [self.recommendScroll addSubview:_fourthLab];
        _fourthLab.text=@"111111";
        _fourthLab.textAlignment=NSTextAlignmentCenter;
        _fourthLab.textColor=[UIColor whiteColor];
        _fourthLab.font=[UIFont systemFontOfSize:14];
        _recommendScroll.showsHorizontalScrollIndicator=NO;
        
    }
    return self;
}

@end
