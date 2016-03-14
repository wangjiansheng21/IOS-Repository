//
//  RankingVC.m
//  Music
//
//  Created by 王凯 on 16/3/12.
//  Copyright © 2016年 王凯. All rights reserved.
//
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

#define URL @"http://tingapi.ting.baidu.com/v1/restserver/ting?method=baidu.ting.billboard.billCategory&format=json&from=ios&version=5.2.1&from=ios&channel=appstore"

#import "RankingVC.h"
#import "RankingCell.h"
#import "AFNetworking.h"
#import "UIImageView+WebCache.h"

@interface RankingVC ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong)UITableView *tableView;

@property(nonatomic,strong)NSMutableArray*rankArr;//存放请求的排行榜数据的数组

@property(nonatomic,strong)NSMutableArray*contentArr;

@property (nonatomic,strong)UIImageView *songTopImageView;//榜单图片
@property (nonatomic,strong)UILabel * songTopName;//榜单名
@property (nonatomic,strong)UIView * lineView;//分割线
@property (nonatomic,strong)UILabel *songName;//歌名
@property (nonatomic,strong)UILabel *topNumber;//歌名排行
@end

@implementation RankingVC

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置NAVC的标题
    self.navigationItem.title = @"音乐排行";
    self.view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"gg.jpg"]];
    [self loadViews];
    [self loadDatas];
}

-(void)loadViews
{
    _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    [self.view addSubview:_tableView];
    
    _tableView.rowHeight=100;
    
    _tableView.delegate=self;
    _tableView.dataSource=self;
    
     _tableView.backgroundColor=[UIColor clearColor];
    

}
-(NSMutableArray*)rankArr
{
    if (_rankArr==nil) {
        _rankArr=[NSMutableArray array];
    }
    return _rankArr;
}

-(NSMutableArray*)contentArr
{
    if (_contentArr==nil) {
        _contentArr=[NSMutableArray array];
    }
    return _contentArr;
}
-(void)loadDatas
{
    AFHTTPRequestOperationManager * manager = [AFHTTPRequestOperationManager manager];
    
    [manager setResponseSerializer:[AFJSONResponseSerializer serializer]];
    
    __weak typeof(self)weakSelf=self;
    [manager GET:URL parameters:nil success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        
        NSDictionary * dict=responseObject;
        NSLog(@"dict:%@",dict);
        _rankArr=dict[@"content"];
        
        _contentArr=[NSMutableArray arrayWithArray:dict[@"content"]];

        NSLog(@"______%@",_rankArr);
        NSLog(@"--------%@",_contentArr);
    
        
        
        [weakSelf.tableView reloadData];
        
    } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
        
        NSLog(@"error %@",error);
        
    }];
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _rankArr.count;
}

//设置每行的高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 190;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell =[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    //榜单图片
    _songTopImageView=[[UIImageView alloc]initWithFrame:CGRectMake(15, 20, kScreenWidth/2.7, kScreenWidth/2.7)];
    [cell addSubview:_songTopImageView];
    [_songTopImageView sd_setImageWithURL:[NSURL URLWithString:_rankArr[indexPath.row][@"pic_s192"]] placeholderImage:[UIImage imageNamed:@"ic_blank_collect"]];
    //榜单名
    _songTopName=[[UILabel alloc]initWithFrame:CGRectMake(15 + self.songTopImageView.bounds.size.width + 15, 10, kScreenWidth - self.songTopImageView.bounds.size.width - 65, 30)];
    [cell addSubview:_songTopName];
    _songTopName.text=_rankArr[indexPath.row][@"name"];
    _songTopName.textColor=[UIColor whiteColor];
    //分割线
    _lineView=[[UIView alloc]initWithFrame:CGRectMake(15 + self.songTopImageView.bounds.size.width + 15, 40, kScreenWidth - self.songTopImageView.bounds.size.width - 65, 1)];
    [cell addSubview:_lineView];
    _lineView.backgroundColor=[UIColor whiteColor];
    
    NSArray *array=self.rankArr[indexPath.row][@"content"];
    
    //歌名（显示四首歌，循环添加）
    for (int i=0; i<4; i++) {
          _songName=[[UILabel alloc]initWithFrame:CGRectMake(15 + self.songTopImageView.bounds.size.width + 30, (i + 1) * 25 + 30, self.lineView.bounds.size.width, 20)];
        _songName.font=[UIFont boldSystemFontOfSize:13];
        [cell addSubview:_songName];
//        _songTopName.text=_rankArr[indexPath.row][@""];
                _songName.text=[NSString stringWithFormat:@"%@-%@",array[i][@"title"],array[i][@"author"]];
        _songName.adjustsFontSizeToFitWidth=YES;
//        _songName.text=[NSString stringWithFormat:@"%@-%@",_contentArr[indexPath.row][@"title"],_contentArr[indexPath.row][@"author"]];
    }


    //歌名排行（显示四位，循环添加）
    for (int i=0; i<4; i++) {
        _topNumber=[[UILabel alloc]initWithFrame:CGRectMake(15 + self.songTopImageView.bounds.size.width + 15, (i + 1) * 25 + 35, 15, 10)];
        _topNumber.font=[UIFont boldSystemFontOfSize:10];
        [cell addSubview:_topNumber];
        _topNumber.text=[NSString stringWithFormat:@"%d",i+1];
    }
    
    
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
