//
//  MessageTableViewCell.m
//  qq
//
//  Created by 王建生 on 16/3/13.
//  Copyright © 2016年 AppleUser. All rights reserved.
//

#import "MessageTableViewCell.h"
@interface MessageTableViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *myImageView;
@property (weak, nonatomic) IBOutlet UILabel *labName;
@property (weak, nonatomic) IBOutlet UILabel *labContent;
@property (weak, nonatomic) IBOutlet UILabel *labTime;
@property (weak, nonatomic) IBOutlet UILabel *labNotReadCounts;

@end
@implementation MessageTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)setModel:(MessageModel *)model{
    _model=model;
    _myImageView.layer.cornerRadius=10;
    _myImageView.layer.masksToBounds=YES;
    _myImageView.image=[UIImage imageNamed:_model.icon];
    _labName.font=[UIFont systemFontOfSize:20];
    _labName.text=_model.name;
    _labContent.text=_model.messageStr;
    _labContent.font=[UIFont systemFontOfSize:17];
    _labTime.text=_model.date;
    _labTime.adjustsFontSizeToFitWidth=YES;
   
}


@end
