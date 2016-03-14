//
//  SongListCell.h
//  Music
//
//  Created by 王凯 on 16/3/14.
//  Copyright © 2016年 王凯. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SongListCell : UITableViewCell
@property(nonatomic,strong)UIImageView*songImage;//圆的图片
@property(nonatomic,strong)UILabel*songNameLab;//歌名
@property(nonatomic,strong)UILabel*detailLab;//简介

@property(nonatomic,strong)UIImageView*noteImage;//音符图标
@property(nonatomic,strong)UILabel*lineLab;//白色横线
@property(nonatomic,strong)UILabel*audienceLab;//听众量
@end
