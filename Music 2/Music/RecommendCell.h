//
//  RecommendCell.h
//  Music
//
//  Created by 王凯 on 16/3/14.
//  Copyright © 2016年 王凯. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RecommendCell : UITableViewCell
@property(nonatomic,strong)UIScrollView*recommendScroll;

@property(nonatomic,strong)UIButton*firstBtn;//第一个圆button
@property(nonatomic,strong)UIButton*secondBtn;//第二个圆button
@property(nonatomic,strong)UIButton*thirdBtn;//第三个圆button
@property(nonatomic,strong)UIButton*fourthBtn;//第四个圆button

@property(nonatomic,strong)UILabel*firstLab;//第一个圆button下的标题
@property(nonatomic,strong)UILabel*secondLab;//第二个圆button下的标题
@property(nonatomic,strong)UILabel*thirdLab;//第三个圆button下的标题
@property(nonatomic,strong)UILabel*fourthLab;//第四个圆button下的标题
@end
