//
//  AddView.m
//  qq
//
//  Created by AppleUser on 16/3/10.
//  Copyright © 2016年 AppleUser. All rights reserved.
//

#import "AddView.h"
#import "AddModel.h"
@implementation AddView
-(NSArray *)dataLists{
    if(_dataLists==nil){
        NSMutableArray *marray=[NSMutableArray new];
        NSString *path=[[NSBundle mainBundle] pathForResource:@"add.plist" ofType:nil];
        NSArray *arr=[NSArray arrayWithContentsOfFile:path];
        for(NSDictionary *dic in arr){
            AddModel *model=[AddModel addModelWithDict:dic];
            [marray addObject:model];
        }
        _dataLists=marray;
        NSLog(@"count:%ld",_dataLists.count);
    };
    return _dataLists;
}

-(instancetype)init{
    if(self=[super init]){
        UITableView *tableView=[UITableView new];
        [self dataLists];
        tableView.dataSource=self;
        tableView.delegate=self;
//        tableView.rowHeight=80;
        self.layer.borderWidth=1;
//        self.layer.borderColor= [[UIColor colorWithWhite:1000 alpha:0.5] CGColor];
        [self addSubview:tableView];
      
        tableView.backgroundColor=[UIColor clearColor];
        NSDictionary *views=@{@"tableView":tableView};
        tableView.translatesAutoresizingMaskIntoConstraints=NO;
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[tableView]|" options:0 metrics:nil views:views]];
       [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[tableView]|" options:0 metrics:nil views:views]];
    }
    return self;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataLists.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier=@"cell";
    UITableViewCell *myCell=[tableView dequeueReusableCellWithIdentifier:identifier];
    if(myCell==nil){
        myCell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    AddModel *model=self.dataLists[indexPath.row];
    myCell.imageView.image =[UIImage imageNamed:@"icon.png"];
    myCell.textLabel.adjustsFontSizeToFitWidth=YES;
    myCell.textLabel.text=model.title;
    return myCell;
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if([self.delegate respondsToSelector:@selector(toAnother:)]){
        [self.delegate toAnother:indexPath.row];
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
