//
//  OtherCell.m
//  气泡聊天
//
//  Created by 王建生 on 16/3/3.
//  Copyright © 2016年 王建生. All rights reserved.
//

#import "OtherCell.h"
#import "Masonry.h"
@interface OtherCell()
@property(nonatomic,strong)UILabel *labMessage;
@property(nonatomic,strong)UILabel *labDate;
@property(nonatomic,strong)UIImageView *iconView;
@end
@implementation OtherCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if(self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        self.labDate=[UILabel new];
        //        创建日期控件
        self.labDate.textAlignment=NSTextAlignmentCenter;
        [self.contentView addSubview:self.labDate];
        [self.labDate mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(self.contentView);
            make.top.equalTo(self.contentView.mas_top);
            make.height.equalTo(@50);
        }];
        //        创建图标控件
        self.iconView=[UIImageView new];
        self.iconView.image=[UIImage imageNamed:@"01.png"];
        self.iconView.layer.cornerRadius=20;
        self.iconView.layer.masksToBounds=YES;
        [self.contentView addSubview:self.iconView];
        [self.iconView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView.mas_left).offset(5);
            make.top.equalTo(self.labDate.mas_bottom);
            make.width.equalTo(@100);
            make.height.equalTo(@100);
//            make.bottom.equalTo(self.contentView).offset(-10);

        }];
        //        创建短信显示控件
        self.labMessage=[UILabel new];
        self.labMessage.numberOfLines=0;
        [self.contentView addSubview:self.labMessage];
        [self.labMessage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(@150);
            make.left.equalTo(self.iconView.mas_right).offset(5);
            make.top.equalTo(self.labDate.mas_bottom);
//            make.bottom.mas_lessThanOrEqualTo(self.mas_bottom);
        }];
//        [self mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.bottom.equalTo(self.iconView).offset(10);
//        }];
        
    }
    return self;
}
-(void)setMessage:(Message *)message{
    _message=message;
    self.labMessage.text=message.messageStr;
    if(message.isHidden){
        self.labDate.text=@"";
        return;
    }
    self.labDate.text=message.dateStr;}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
