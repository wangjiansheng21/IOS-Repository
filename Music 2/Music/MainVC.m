//
//  MainVC.m
//  Music
//
//  Created by 王凯 on 16/3/12.
//  Copyright © 2016年 王凯. All rights reserved.
//
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
//首页轮播图url
#define URL @"http://tingapi.ting.baidu.com/v1/restserver/ting?method=baidu.ting.plaza.getFocusPic&format=json&from=ios&version=5.2.3&from=ios&channel=appstore"
//热门推荐
#define RecommendURL @"http://tingapi.ting.baidu.com/v1/restserver/ting?method=baidu.ting.diy.getHotGeDanAndOfficial&num=4&version=5.2.3&from=ios&channel=appstore"
//热门歌手
#define SONGURL @"http://tingapi.ting.baidu.com/v1/restserver/ting?method=baidu.ting.diy.gedan&page_no=1&page_size=30&from=ios&version=5.2.3&from=ios&channel=appstore"

#import "MainVC.h"
#import "SDCycleScrollView.h"
#import "AFNetworking.h"
#import "RecommendModel.h"
#import "SongListCell.h"
#import "RecommendCell.h"
#import "UIButton+WebCache.h"
#import "UIImageView+WebCache.h"



@interface MainVC ()<SDCycleScrollViewDelegate,UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate>
@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong)SDCycleScrollView *cycleScrollView;

@property (nonatomic,strong)NSMutableArray *imagesURLStrings;


@property(nonatomic,strong)NSMutableArray*recommendArr;//存放热门推荐数据的数组


@property(nonatomic,strong)NSMutableArray*songsListArr;//热门歌单数据数组

@end

@implementation MainVC

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置NAVC的标题
    self.navigationItem.title = @"听觉盛宴";
    
    self.view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"gg.jpg"]];
    
    UIButton *imgBtn=[[UIButton alloc]initWithFrame:CGRectMake(10, 20, 30, 30)];
    UIBarButtonItem *right=[[UIBarButtonItem alloc]initWithCustomView:imgBtn ];
    [imgBtn setBackgroundImage:[UIImage imageNamed:@"icon_upbar_icon_playing1"] forState:UIControlStateNormal];
    self.navigationItem.rightBarButtonItem=right;
    
    [self loadViews];
    [self loadData];
    [self loadRecommendData];
    [self loadSongslistDatas];
    
}
//轮播图
-(NSMutableArray*)imagesURLStrings
{
    if (_imagesURLStrings==nil) {
        _imagesURLStrings=[NSMutableArray array];
    }
    return _imagesURLStrings;
}
//推荐
-(NSMutableArray*)recommendArr
{
    if (_recommendArr==nil) {
        _recommendArr=[NSMutableArray array];
    }
    return _recommendArr;
}
//推荐歌手
-(NSMutableArray*)songsListArr
{
    if (_songsListArr==nil) {
        _songsListArr=[NSMutableArray array];
    }
    return _songsListArr;
}

-(void)loadViews
{
    _tableView=[[UITableView alloc]initWithFrame:self.view.frame];
    [self.view addSubview:_tableView];
    
    _tableView.delegate=self;
    _tableView.dataSource=self;
    
    _tableView.backgroundColor=[UIColor clearColor];
   
    _cycleScrollView=[SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 180) imageURLStringsGroup:_imagesURLStrings ];
    //设置是否无限循环
    _cycleScrollView.infiniteLoop=YES;
    //设置代理
    _cycleScrollView.delegate=self;
    //设置每个图片滚动的间距时间
    _cycleScrollView.autoScrollTimeInterval=2;
    //设置pageControl的风格
    _cycleScrollView.pageControlStyle=SDCycleScrollViewPageContolStyleAnimated;
  
    _tableView.tableHeaderView=_cycleScrollView ;
    
    [_tableView registerClass:[RecommendCell class] forCellReuseIdentifier:@"recommendCell"];
    [_tableView registerClass:[SongListCell class] forCellReuseIdentifier:@"songCell"];
    
}

-(void)loadData
{
    //af http请求操作的管理器
    AFHTTPRequestOperationManager * manager = [AFHTTPRequestOperationManager manager];
    //2、设定返回的数据以什么方式解析（设定解析响应数据的工具类）
    [manager setResponseSerializer:[AFJSONResponseSerializer serializer]];
    
    __weak typeof(self)weakSelf=self;
    [manager GET:URL parameters:nil success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        
        NSArray*dataArr=responseObject[@"pic"];
        for (NSDictionary* tmp in dataArr) {
            NSString *picUrl=tmp[@"randpic"];
            [weakSelf.imagesURLStrings addObject:picUrl];
            NSLog(@"%@",picUrl);
        }
        
        weakSelf.cycleScrollView.imageURLStringsGroup=weakSelf.imagesURLStrings;
        
        [weakSelf.tableView reloadData];

    } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
        
        NSLog(@"error %@",error);
        
    }];
    
    
    
}


-(void)loadRecommendData
{
    AFHTTPRequestOperationManager * manager = [AFHTTPRequestOperationManager manager];
   
    [manager setResponseSerializer:[AFJSONResponseSerializer serializer]];
    
    __weak typeof(self)weakSelf=self;
        [manager GET:RecommendURL parameters:nil success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
    
            NSDictionary *dict=responseObject[@"content"];
             NSMutableArray*arr=dict[@"list"];
    
            for (NSDictionary* tmp in arr) {
    
                [weakSelf.recommendArr addObject:[RecommendModel recommendModelWithDict:tmp]];
                NSLog(@"%@",tmp);

            }
            NSLog(@"%lu",weakSelf.recommendArr.count);
//            for (int i=0; i<weakSelf.recommendArr.count; i++) {
//            
//            [_imagesArr addObject:weakSelf.recommendArr[i][@"pic"]];
//            
//            }

//            NSLog(@"___________________%@",_imagesArr);
            [weakSelf.tableView reloadData];
    
        } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
    
            NSLog(@"error %@",error);
            
        }];
}

//请求热门歌单数据
-(void)loadSongslistDatas
{
    AFHTTPRequestOperationManager * manager = [AFHTTPRequestOperationManager manager];
    
    [manager setResponseSerializer:[AFJSONResponseSerializer serializer]];
    
    __weak typeof(self)weakSelf=self;
    [manager GET:SONGURL parameters:nil success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        
        _songsListArr=responseObject[@"content"];
//        NSLog(@"______%@",_songsListArr);

        NSLog(@"%lu",_songsListArr.count);
      
    
        [weakSelf.tableView reloadData];
        
    } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
        
        NSLog(@"error %@",error);
        
    }];

    
}

-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UILabel* lab=[[UILabel alloc]initWithFrame:CGRectMake(15, 0, 100, 15)];
    UIView * view=[[UIView alloc]initWithFrame:CGRectMake(0, 15, kScreenWidth-30, 1)];
    [view addSubview:lab];
//    [view setBackgroundColor:[UIColor whiteColor]];
//    view.backgroundColor=[UIColor whiteColor];
    lab.textColor=[UIColor whiteColor];
    switch (section) {
        case 0:
           lab.text=@"热门推荐";
            break;
        case 1:
           lab.text=@"热门歌单";
            break;
     
    }
    return view;
 
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 25;
}

//每组有多少行
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section==0){
        return 1;
    }else{
        NSLog(@"------------%lu",_songsListArr.count);
    return _songsListArr.count;
    }

}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0) {
        return 220;
    }
    return 170;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0) {
   RecommendCell*cell=[_tableView dequeueReusableCellWithIdentifier:@"recommendCell"];
        NSArray *arr=@[cell.firstBtn,cell.secondBtn,cell.thirdBtn,cell.fourthBtn];
        for (int i=0; i<4; i++) {
            RecommendModel *recommend=_recommendArr[i];
            UIButton *btn=arr[i];
            NSURL *url=[NSURL URLWithString:recommend.pic];
            [btn sd_setBackgroundImageWithURL:url forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@"ic_blank_collect"]];
        }
        NSArray *titleArr=@[cell.firstLab,cell.secondLab,cell.thirdLab,cell.fourthLab];
        for (int i=0; i<4; i++) {
            RecommendModel *recommend=_recommendArr[i];
            UILabel *lab=titleArr[i];
            lab.text=recommend.title;
        }
    cell.backgroundColor=[UIColor clearColor];
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    return cell;
    }
        SongListCell*cell=[_tableView dequeueReusableCellWithIdentifier:@"songCell"];
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
//    NSLog(@"%@",_songsListArr[0][@"pic_300"]);
//    NSLog(@"%ld",_songsListArr.count);

    [cell.songImage sd_setImageWithURL:[NSURL URLWithString:_songsListArr[indexPath.row][@"pic_300"]] placeholderImage:[UIImage imageNamed:@"ic_blank_collect"]];
       cell.songNameLab.text=_songsListArr[indexPath.row][@"tag"];
        cell.detailLab.text=_songsListArr[indexPath.row][@"desc"];
    
        cell.audienceLab.text=_songsListArr[indexPath.row][@"listenum"];

    
        
        cell.backgroundColor=[UIColor clearColor];
        
        return cell;

  
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    if (indexPath.section==1) {
//        SongDetailViewController*songVc=[SongDetailViewController new];
//        songVc.url=[NSURL URLWithString:_songsListArr[indexPath.row][@"pic_300"]];
//        songVc.listIdStr=_songsListArr[indexPath.row][@"listid"];
//        UINavigationController*navc=[[UINavigationController alloc]initWithRootViewController:songVc];
//        [self presentViewController:navc animated:YES completion:nil];
//    }
//    
}
-(void)turnToMusicList1
{
    
}
-(void)turnToMusicList2
{
    
}
-(void)turnToMusicList3
{
    
}
-(void)turnToMusicList4
{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - SDCycleScrollViewDelegate
//轮播图点击事件
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{
    NSLog(@"---点击了第%ld张图片", index);
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
