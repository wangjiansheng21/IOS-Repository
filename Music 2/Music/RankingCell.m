//
//  RankingCell.m
//  Music
//
//  Created by 王凯 on 16/3/14.
//  Copyright © 2016年 王凯. All rights reserved.
//

#import "RankingCell.h"
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
@implementation RankingCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        _songTopImageView=[[UIImageView alloc]initWithFrame:CGRectMake(15, 20, kScreenWidth/2.7, kScreenWidth/2.7)];
        [self.contentView addSubview:_songTopImageView];
        
        _songTopNameLab=[[UILabel alloc]initWithFrame:CGRectMake(15+self.songTopImageView.bounds.size.width+15, 10, kScreenWidth-self.songTopImageView.bounds.size.width-65, 30)];
        [self.contentView addSubview:_songTopNameLab];
        _songTopNameLab.textColor=[UIColor whiteColor];
        
        
        _lineView=[[UIView alloc]initWithFrame:CGRectMake(15+self.songTopImageView.bounds.size.width+15, 40, kScreenWidth-self.songTopImageView.bounds.size.width-65, 1)];
        [self.contentView addSubview:_lineView];
        _lineView.backgroundColor=[UIColor whiteColor];
        
        
        _firstsongNameLab=[[UILabel alloc]initWithFrame:CGRectMake(15+self.songTopImageView.bounds.size.width+30, 25+30, self.lineView.bounds.size.width, 20)];
        _firstsongNameLab.font=[UIFont systemFontOfSize:13];
        _firstsongNameLab.textColor=[UIColor whiteColor];
        [self.contentView addSubview:_firstsongNameLab];
        
        
        _secondsongNameLab=[[UILabel alloc]initWithFrame:CGRectMake(15+self.songTopImageView.bounds.size.width+30, 2*25+30, self.lineView.bounds.size.width, 20)];
        _secondsongNameLab.font=[UIFont systemFontOfSize:13];
        _secondsongNameLab.textColor=[UIColor whiteColor];
        [self.contentView addSubview:_secondsongNameLab];
        
        
        _thirdsongNameLab=[[UILabel alloc]initWithFrame:CGRectMake(15+self.songTopImageView.bounds.size.width+30, 3*25+30, self.lineView.bounds.size.width, 20)];
        _thirdsongNameLab.font=[UIFont systemFontOfSize:13];
        _thirdsongNameLab.textColor=[UIColor whiteColor];
        [self.contentView addSubview:_thirdsongNameLab];
        
        
        _fourthsongNameLab=[[UILabel alloc]initWithFrame:CGRectMake(15+self.songTopImageView.bounds.size.width+30, 4*25+30, self.lineView.bounds.size.width, 20)];
        _fourthsongNameLab.font=[UIFont systemFontOfSize:13];
        _fourthsongNameLab.textColor=[UIColor whiteColor];
        [self.contentView addSubview:_fourthsongNameLab];
        
        
        for (int i=0; i<4; i++) {
            _topNumberLab=[[UILabel alloc]initWithFrame:CGRectMake(15+self.songTopImageView.bounds.size.width+15, (i+1)*25+35, 15, 10)];
            _topNumberLab.text=[NSString stringWithFormat:@"%d",i+1];
            _topNumberLab.font=[UIFont systemFontOfSize:10];
            _topNumberLab.textColor=[UIColor whiteColor];
            [self.contentView addSubview:_topNumberLab];
            
        }
    }
    
    return self;
    
}

@end
