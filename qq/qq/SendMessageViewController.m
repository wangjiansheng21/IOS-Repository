//
//  SendMessageViewController.m
//  qq
//
//  Created by 王建生 on 16/3/13.
//  Copyright © 2016年 AppleUser. All rights reserved.
//

#import "SendMessageViewController.h"
#import "Masonry.h"
#import "MyCell.h"
#import "OtherCell.h"
#define APPH [UIScreen mainScreen].bounds.size.height
#define APPW [UIScreen mainScreen].bounds.size.width
#define KBOARDH 30
#define KTOPLAYOUT_GUIDEH 20
@interface SendMessageViewController ()<UITableViewDelegate,UITextFieldDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)UIView *myKeyBoardView;
@property(nonatomic,strong)NSMutableArray *marr;
- (IBAction)backAction:(UIBarButtonItem *)sender;
@property(nonatomic,copy)UITextField *txtMessage;
@property (weak, nonatomic) IBOutlet UINavigationBar *navigationBar;
@property (weak, nonatomic) IBOutlet UILabel *labName;


@end

@implementation SendMessageViewController{
    UIControl *  controll;
    UIButton *btnSend;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self notifiSeting];
    [self initView];
    NSString *path=[NSHomeDirectory() stringByAppendingPathComponent:@"Documents//message.plist"];
    
    _marr=  [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    self.navigationItem.title=@"xxxx";
    self.title=@"xxx";
    self.view.backgroundColor=[UIColor blueColor];
    self.tableView.rowHeight=150;
    self.tableView.dataSource=self;
    [self scroolToBottom];
    [self updateTime];
    [self initFooterView];
    //    self.tableView.backgroundColor=[UIColor clearColor];
    [self constraintTableView];
    [self constraintMyKeyBoardViewAndSubViews];
    
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)initView{
    self.navigationBar.barTintColor=[UIColor blueColor];
    self.navigationBar.tintColor=[UIColor whiteColor];
    [self.labName setTextColor:[UIColor whiteColor]];
    self.labName.adjustsFontSizeToFitWidth=YES;
    self.labName.text=self.model.name;
    
//    NSLog(@"self.model.name:%@",self.model.name);
//    self.navigationItem.title=self.model.name;
}
-(void)updateTime{
    Message *preMessage;
    for (Message *message in  self.marr) {
        if([message.dateStr isEqualToString:preMessage.dateStr]){
            message.hidden=YES;
        }else{
            message.hidden=NO;
        }
        preMessage=message;
    }
    
}
-(void)scroolToBottom{
    if(!self.marr.count==0){
        NSIndexPath *path=[NSIndexPath indexPathForRow:self.marr.count-1 inSection:0];
        [self.tableView scrollToRowAtIndexPath:path atScrollPosition:UITableViewScrollPositionBottom animated:YES];
        //        self.tableView.contentInset=UIEdgeInsetsMake(0, 0,30, 0);
    }
    
}
-(void)initFooterView{
    UIView *view=[UIView new];
    view.backgroundColor=[UIColor clearColor];
    self.tableView.tableFooterView=view;
    //    self.tableView.backgroundColor=[UIColor redColor];
    
}
#pragma mark UITableViewDelegate UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.marr.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier1=@"myCell";
    static NSString *identifier2=@"otherCell";
    Message *message=self.marr[indexPath.row];
    if(message.isMe){
        MyCell *cell=[tableView dequeueReusableCellWithIdentifier:identifier1];
        if(cell==nil){
            cell=[[MyCell alloc] initWithStyle: UITableViewCellStyleSubtitle reuseIdentifier:identifier1];
        }
        NSLog(@"%@",message);
        cell.message=message;
        //        cell.backgroundColor=[UIColor cyanColor];
        
        return cell;
    }else{
        OtherCell *cell=[tableView dequeueReusableCellWithIdentifier:identifier2];
        if(cell==nil){
            cell=[[OtherCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier2];
        }
        cell.message=message;
        //        cell.backgroundColor=[UIColor cyanColor];
        return cell;
        
    }
}
#pragma mark UITableViewDelegate
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if(editingStyle==UITableViewCellEditingStyleDelete){
        [self.marr removeObjectAtIndex:indexPath.row];
        //        更新时间显示
        [self updateTime];
        [self.tableView reloadData];
        [self writeToFile];
    }
}
-(NSMutableArray *)marr{
    if(_marr==nil){
        _marr=[NSMutableArray new];
        
        
        NSLog(@"_marr:%@",_marr);
    }
    return _marr;
}

- (IBAction)backAction:(UIBarButtonItem *)sender {
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}
-(UITableView *)tableView{
    if(_tableView==nil){
        _tableView=[UITableView new];
        
        [self.view addSubview:_tableView];
    }
    return _tableView;
}
//约束_tableView
-(void)constraintTableView{
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(self.navigationBar.mas_bottom);
        make.height.equalTo(@(APPH-KTOPLAYOUT_GUIDEH-KBOARDH));
        
    }];
}
//约束键盘及其子控件
-(void)constraintMyKeyBoardViewAndSubViews{
    [self.myKeyBoardView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.height.equalTo(@(KBOARDH));
        make.bottom.equalTo(self.view.mas_bottom);
    }];
    _txtMessage=[UITextField new];
    _txtMessage.delegate=self;
    //    txtMessage.backgroundColor=[UIColor grayColor];
    _txtMessage.layer.borderWidth=1;
    _txtMessage.borderStyle=UITextBorderStyleRoundedRect;
    _txtMessage.clearButtonMode= UITextFieldViewModeAlways;
    btnSend=[UIButton buttonWithType:UIButtonTypeSystem];
    btnSend.enabled=NO;
    btnSend.backgroundColor=[UIColor whiteColor];
    [btnSend setTitle:@"发送" forState:UIControlStateNormal];
    [self.myKeyBoardView addSubview:btnSend];
    [self.myKeyBoardView addSubview:_txtMessage];
    //    约束文本输入框
    [_txtMessage mas_makeConstraints:^(MASConstraintMaker *make) {
        //        make.centerY.equalTo(myKeyBoardView.mas_centerY);
        make.left.equalTo(self.myKeyBoardView.mas_left).offset(10);
        make.right.equalTo(btnSend.mas_left).offset(-10);
        make.bottom.equalTo(self.myKeyBoardView.mas_bottom);
    }];
    //    约束发送按钮
    [btnSend mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.view.mas_right);
        //        make.centerY.equalTo(myKeyBoardView.mas_centerY);
        make.width.equalTo(self.view.mas_width).multipliedBy(0.3);
        make.bottom.equalTo(self.myKeyBoardView.mas_bottom);
    }];
    [btnSend addTarget:self action:@selector(sendMessag) forControlEvents:UIControlEventTouchUpInside];
}
-(void)sendMessag{
    Message *message=[Message new];
    message.isMe=YES;
    message.messageStr=self.txtMessage.text;
    self.txtMessage.text=@"";
    btnSend.enabled=NO;
    //    开启新线程
    [[NSOperationQueue new] addOperationWithBlock:^{
        message.dateStr=[self nowTime];
        [self.marr addObject:message];
        [self updateTime];
        
#if 1
        NSLog(@"dateStr:%@.count:%ld:hiden:%d",message.dateStr,(unsigned long)self.marr.count,message.hidden);
#endif
        
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            NSIndexPath *path=[NSIndexPath indexPathForRow:self.marr.count-1 inSection:0];
            [self.tableView insertRowsAtIndexPaths:@[path] withRowAnimation:UITableViewRowAnimationNone];
            [self scroolToBottom];
        }];
        [self writeToFile];
        
    }];
    
    
    //    [self.myKeyBoardView mas_updateConstraints:^(MASConstraintMaker *make) {
    //        make.bottom.equalTo(self.view.mas_bottom).offset(-270);
    //    }];
    NSLog(@"1+++");
    //    [self.txtMessage resignFirstResponder];
    NSLog(@"2+++");
    
}
-(void)writeToFile{
    NSString *path=[NSHomeDirectory() stringByAppendingPathComponent:@"Documents//message.plist"];
    BOOL ret =   [NSKeyedArchiver archiveRootObject:self.marr toFile:path];
    
    if(ret){
        NSLog(@"write:success");
    }
}
-(NSString *)nowTime{
    NSDate *now=[NSDate date];
    NSDateFormatter *fmt=[NSDateFormatter new];
    fmt.dateFormat=@"yyyy-MM-dd a HH:mm";
    return [fmt stringFromDate:now];
}
-(UIView *)myKeyBoardView{
    if(_myKeyBoardView==nil){
        _myKeyBoardView=[UIView new];
//        _myKeyBoardView.backgroundColor=[UIColor grayColor];
        [self.view addSubview:_myKeyBoardView];
    }
    return _myKeyBoardView;
}


#pragma mark UITextFieldDelegate
-(void)creatControll{
    controll=[UIControl new];
    controll.backgroundColor=[UIColor clearColor];
    [self.view addSubview:controll];
    [controll mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.tableView);
        make.top.equalTo(self.tableView.mas_top);
        make.bottom.equalTo(self.myKeyBoardView.mas_top).offset(-2);
    }];
    [controll addTarget:self action:@selector(controllClickAction) forControlEvents:UIControlEventTouchUpInside];
}
//收起键盘
-(void)controllClickAction{
    NSLog(@"1---");
    
    [controll removeFromSuperview];
    controll=nil;
    
    [self.myKeyBoardView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view.mas_bottom);
    }];
    [self.tableView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@(APPH-KBOARDH-KTOPLAYOUT_GUIDEH));
    }];
    NSLog(@"2---");
    [self.view endEditing:YES];
}
-(void)notifiSeting{
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(enableBtnSend) name:UITextFieldTextDidChangeNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
}

-(void)keyboardWillShow:(NSNotification *)noti{
    CGRect keyboardframe=  [[noti.userInfo objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
    CGFloat height=  keyboardframe.size.height;
    //    更新约束
    [self.myKeyBoardView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view.mas_bottom).offset(-height);
    }];
    
    [self creatControll];
    [self.tableView mas_updateConstraints:^(MASConstraintMaker *make) {
        NSLog(@"APPH:%f",APPH);
        NSLog(@"APPH-height-KBOARDH-KTOPLAYOUT_GUIDEH:%f",APPH-height-KBOARDH-KTOPLAYOUT_GUIDEH);
        NSLog(@"height:%f",height);
        make.height.equalTo(@(APPH-height-KBOARDH-KTOPLAYOUT_GUIDEH));
    }];
    if(self.marr.count==0){
        return;
    }
    [self scroolToBottom];
}
-(void)keyboardWillHide:(NSNotification *)noti{
    
}

-(void)enableBtnSend{
    btnSend.enabled=self.txtMessage.text.length;
}

@end
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


