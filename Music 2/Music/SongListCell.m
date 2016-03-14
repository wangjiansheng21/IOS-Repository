//
//  SongListCell.m
//  Music
//
//  Created by 王凯 on 16/3/14.
//  Copyright © 2016年 王凯. All rights reserved.
//
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
#import "SongListCell.h"

@implementation SongListCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //热门歌单的每个图片设置frame，并将其设成圆形
        _songImage=[[UIImageView alloc]initWithFrame:CGRectMake(15, 15, self.frame.size.width/2.7, self.frame.size.width/2.7)];
        [self.contentView addSubview:_songImage];
        _songImage.layer.masksToBounds=YES;
        _songImage.layer.borderWidth=2;
        _songImage.layer.cornerRadius=self.songImage.frame.size.height/2;
        _songImage.layer.borderColor=[UIColor whiteColor].CGColor;
        
        
        //歌名label设置frame，并设置字体大小，字体颜色
        _songNameLab=[[UILabel alloc]initWithFrame:CGRectMake(self.songImage.frame.size.width+30, 15, kScreenWidth/1.86, 25)];
        [self.contentView addSubview:_songNameLab];
        _songNameLab.textColor=[UIColor whiteColor];
        _songNameLab.font=[UIFont systemFontOfSize:15];
        
        //白色横线的label设置frame
        _lineLab=[[UILabel alloc]initWithFrame:CGRectMake(self.songNameLab.frame.origin.x, self.songNameLab.frame.origin.y+25, kScreenWidth/2, 1)];
        [self.contentView addSubview:_lineLab];
        _lineLab.backgroundColor=[UIColor whiteColor];
        
        //简介的label设置frame，并且设置换行显示，字体大小，字体颜色
        _detailLab=[[UILabel alloc]initWithFrame:CGRectMake(self.songNameLab.frame.origin.x, self.songNameLab.frame.size.height+15, kScreenWidth/2, 100)];
        [self.contentView addSubview:_detailLab];
        _detailLab.lineBreakMode=NSLineBreakByWordWrapping;
        _detailLab.numberOfLines=0;
        _detailLab.text=@"------------------";
        _detailLab.font=[UIFont systemFontOfSize:14];
        _detailLab.textColor=[UIColor whiteColor];
        
        //音符图标设置frame
        _noteImage=[[UIImageView alloc]initWithFrame:CGRectMake(self.songImage.frame.size.width+30, self.songImage.frame.size.height+15, 15, 15)];
        
        _noteImage.image=[UIImage imageNamed:@"sing_img_note8@2x"];
        [self.contentView addSubview:_noteImage];
        
        //听众量的label设置frame，设置字体大小,字体颜色
        _audienceLab=[[UILabel alloc]initWithFrame:CGRectMake(self.songImage.frame.size.width+50, self.songImage.frame.size.height+15, 70, 20)];
        _audienceLab.font=[UIFont systemFontOfSize:14];
        _audienceLab.textColor=[UIColor whiteColor];
        _audienceLab.text=@"222334";
        [self.contentView addSubview:_audienceLab];
        
    }
    return self;
}


@end
