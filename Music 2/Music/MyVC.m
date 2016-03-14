//
//  MyVC.m
//  Music
//
//  Created by 王凯 on 16/3/12.
//  Copyright © 2016年 王凯. All rights reserved.
//

#import "MyVC.h"

@interface MyVC ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong)UITableView * tableView;
@property (nonatomic,strong)NSArray * array;
@end

@implementation MyVC

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置NAVC的标题
    self.navigationItem.title = @"我的音乐";
    [self loadViews];
}

-(void)loadViews
{
    _array=@[@"歌曲列表࿐",@"下载列表࿐",@"最近播放࿐",@"设置࿐",];
    
//    _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 375, 677) style:UITableViewStylePlain];
    _tableView=[[UITableView alloc]initWithFrame:self.view.frame];
    
    _tableView.rowHeight=100;
    _tableView.dataSource=self;
    _tableView.delegate=self;
    
    UIImageView *bgImg=[[UIImageView alloc]initWithFrame:self.view.bounds];
    bgImg.image=[UIImage imageNamed:@"10张模糊背景图片素材08_lanrentuku.com.jpg"];
    [self.view addSubview:bgImg];
    [self.view addSubview:_tableView];
    
    _tableView.backgroundColor=[UIColor clearColor];
    
}

//多少个cell
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _array.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    UILabel *lbtitle=[[UILabel alloc]initWithFrame:CGRectMake(20, 60, 200, 40)];
    lbtitle.text=_array[indexPath.row];
    
    [cell.contentView addSubview:lbtitle];
    cell.backgroundColor=[UIColor clearColor];
    return cell;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
