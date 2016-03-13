//
//  MessageViewController.m
//  qq
//
//  Created by AppleUser on 16/3/10.
//  Copyright © 2016年 AppleUser. All rights reserved.
//
#import "SendMessageViewController.h"
#import "MessageTableViewCell.h"
#import "MessageViewController.h"
#import "ScanViewController.h"
#import "AddFriendViewController.h"
#import "CreateTalkGroupViewController.h"
#import "SendToComputerViewController.h"
#import "FaceToFaceFastTransformViewController.h"
#import "CollectMoneyViewController.h"
#import "PhoneYellowPageViewController.h"
#import "AddView.h"
#define  APPW [UIScreen mainScreen].bounds.size.width
#define APPH [UIScreen mainScreen].bounds.size.height
#define WIDTH 150
#define HEIGHT 250
//#define TabBar_T_Color RGB(244, 89, 27)
@interface MessageViewController ()<AddViewDelegate,UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate,UIScrollViewDelegate>
@property(nonatomic,strong)AddView *addView;
@property(nonatomic,strong)NSArray *controllers;
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSArray *dataLists;
@property(nonatomic,strong)NSArray *displayArray;
@property(nonatomic,strong)UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segment;

@end

@implementation MessageViewController{
    BOOL isFirstClick;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [super initViews];
    [self initViews];
    // Do any additional setup after loading the view.
}
-(void)viewWillAppear:(BOOL)animated{
     self.tabBarController.tabBar.hidden=NO;
}
//懒加载用self.dataLists[]访问;
-(NSArray *)dataLists{
    if(_dataLists==nil){
        NSMutableArray *mArray=[NSMutableArray new];
        NSString *path=[[NSBundle mainBundle] pathForResource:@"Message.plist" ofType:nil];
    NSArray *arry    =[NSMutableArray arrayWithContentsOfFile:path];
        for(NSDictionary *dic in arry){
            MessageModel *model=[MessageModel messageModelWithDic:dic];
            [mArray addObject:model];
        }
        _dataLists=mArray;
        
    }
    return _dataLists;
}
-(NSArray *)displayArray{
    if(_displayArray==nil){
        _displayArray=self.dataLists;
    }
    return _displayArray;
}
-(NSArray *)controllers{
    if(_controllers==nil){
        
        _controllers=@[
                       [ScanViewController new],
                       [AddFriendViewController new],
                       [CreateTalkGroupViewController new],
                       [SendToComputerViewController new],
                       [FaceToFaceFastTransformViewController new],
                       [CollectMoneyViewController new]
                       ];
    }
    return _controllers;
}
-(AddView *)addView{
     isFirstClick=NO;
    if(_addView==nil){
        isFirstClick=YES;
        _addView=[[AddView alloc] init];
        _addView.delegate=self;
        [self.view insertSubview:_addView aboveSubview:self.tableView];
        _addView.frame=CGRectMake(APPW-WIDTH-8,80,WIDTH, HEIGHT);
        
    }
   
    return _addView;
}

-(void)initViews{
    self.searchBar=[UISearchBar new];
    self.searchBar.frame=CGRectMake(0, 0,APPW,50);
    self.tableView=[[UITableView alloc ]initWithFrame:CGRectMake(0, 0, APPW, APPH) style: UITableViewStylePlain];
    self.tableView.dataSource=self;
    self.tableView.delegate=self;
    self.tableView.rowHeight=80;
    self.tableView.tableHeaderView=self.searchBar;
    self.searchBar.delegate=self;
    self.view.backgroundColor=[UIColor redColor];
    [self.view addSubview:self.tableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)addAction:(UIBarButtonItem *)sender {
   
    if(self.addView&&isFirstClick){
        return;
    }
    self.addView.hidden=!self.addView.hidden;
}
#pragma mark UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.displayArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier1=@"cell1";
    static NSString *identifier2=@"cell2";
    UITableViewCell *myCell=nil;
    if(self.segment.selectedSegmentIndex==0){
        myCell=[tableView dequeueReusableCellWithIdentifier:identifier1];
        if(myCell==nil){
            myCell=[[[NSBundle mainBundle]loadNibNamed:@"MessageTableViewCell" owner:self options:nil] lastObject];
        }
    ((MessageTableViewCell*)myCell).model=self.displayArray[indexPath.row];
    }else{
        myCell=[tableView dequeueReusableCellWithIdentifier:identifier2];
        if(myCell==nil){
            myCell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier2];
        }
        myCell.imageView.image=[UIImage imageNamed:self.displayArray[indexPath.row]];
        myCell.textLabel.text=self.displayArray[indexPath.row];
        myCell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    }
   

    return myCell;
}
#pragma mark UITableViewDelegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if(self.segment.selectedSegmentIndex==0){
        SendMessageViewController *svc=[[SendMessageViewController alloc] initWithNibName:@"SendMessageViewController" bundle:nil];
        svc.model=self.self.displayArray[indexPath.row];
        [self presentViewController:svc animated:YES completion:^{
            
        }];
    }else{
        if(indexPath.row==0){
            PhoneYellowPageViewController *phoneYellowPage=[PhoneYellowPageViewController new];
//            self.navigationItem.backBarButtonItem.title=@"电话";
            [self.navigationController pushViewController:phoneYellowPage animated:YES];
        }else{
            
        }
    }
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(self.segment.selectedSegmentIndex==1){
        return 50;
    }
    return 80;
}
#pragma mark UIScrollViewDelegate
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    [self.view endEditing:YES];
}
#pragma mark AddViewDelegate
-(void)toAnother:(NSInteger)index{
    self.addView.hidden=YES;
//    [self presentViewController:self.controllers[index] animated:YES completion:^{
    
//    }];
    [self.navigationController hidesBottomBarWhenPushed];
      [self.navigationController pushViewController:self.controllers[index] animated:YES ];
    
}
#pragma mark UISearchBarDelegate
-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    if(self.segment.selectedSegmentIndex==0){
        if(searchText.length==0){
            self.displayArray=self.dataLists;
            [self.tableView reloadData];
            return;
        }
        NSPredicate *pre=[NSPredicate predicateWithFormat:@"self.name contains %@",searchText];
        self.displayArray=[self.dataLists filteredArrayUsingPredicate:pre];
        [self.tableView reloadData];
    }else{
        
    }
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)valueChangeAction:(UISegmentedControl *)sender {
    self.displayArray=nil;
    if(self.segment.selectedSegmentIndex==1){
        self.displayArray=@[@"电话黄页",@"通讯录"];
    }else{
        self.displayArray=self.dataLists;
    }
    [self.tableView reloadData];
}

@end
