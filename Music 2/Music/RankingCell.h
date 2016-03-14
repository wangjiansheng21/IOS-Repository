//
//  RankingCell.h
//  Music
//
//  Created by 王凯 on 16/3/14.
//  Copyright © 2016年 王凯. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RankingCell : UITableViewCell
@property(nonatomic,strong)UIImageView*songTopImageView;//各个排行榜图片
@property(nonatomic,strong)UILabel*songTopNameLab;//榜名
@property(nonatomic,strong)UIView*lineView;//白色横线

@property(nonatomic,strong)UILabel*firstsongNameLab;//排行第一个歌曲的label
@property(nonatomic,strong)UILabel*secondsongNameLab;//排行第二歌曲label
@property(nonatomic,strong)UILabel*thirdsongNameLab;//排行第三歌曲label
@property(nonatomic,strong)UILabel*fourthsongNameLab;//排行第四歌曲label

@property(nonatomic,strong)UILabel*topNumberLab;//1，2，3，4显示的labe
@end
