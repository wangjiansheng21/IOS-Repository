//
//  ViewController.m
//  xml解析
//
//  Created by 王建生 on 16/3/12.
//  Copyright © 2016年 王建生. All rights reserved.
//

#import "ViewController.h"
#import "Model.h"
#define APPW [UIScreen mainScreen].bounds.size.width
#define APPH  [UIScreen mainScreen].bounds.size.height
@interface ViewController ()<NSXMLParserDelegate,UITableViewDataSource>
@property(nonatomic,strong)NSMutableArray *dataLists;
@property(nonatomic,assign)NSInteger currentID;
@property(nonatomic,copy)NSString * currentElement;
@property(nonatomic,strong)UITableView *tableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initView];

   
    NSLog(@"count :%ld",self.dataLists.count);
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)initView{
    
    self.tableView=[UITableView new];
    [self.view addSubview:self.tableView];
    self.tableView.frame=CGRectMake(0, 0,APPW , APPH);
    self.tableView.dataSource=self;
    self.tableView.rowHeight=80;
}
-(void)startParser{
    NSURL *url;
    NSString *string;
    if(string.length==0){
        string=[[NSBundle mainBundle]pathForResource:@"note2.xml" ofType:nil];
        url=[NSURL fileURLWithPath:string];
    }else{
        url=[NSURL URLWithString:string];
    }
    NSXMLParser *parse=[[NSXMLParser alloc] initWithContentsOfURL:url];
    parse.delegate=self;
    [parse parse];
     NSLog(@"---");
    
}
#pragma mark NSXMLParserDelegate
-(void)parserDidStartDocument:(NSXMLParser *)parser{
    NSLog(@"文档开始解析");
}
-(NSMutableArray *)dataLists{
    if(_dataLists==nil){
        _dataLists=[NSMutableArray new];
        [self startParser];
    }
    return _dataLists;
}
-(void)parserDidEndDocument:(NSXMLParser *)parser{
     NSLog(@"文档解析结束");
}
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary<NSString *,NSString *> *)attributeDict{
    NSLog(@"遇到开始标签");
    NSLog(@"elementName:%@",elementName);
    if([elementName isEqualToString:@"Note"]){
        _currentID=[attributeDict[@"id"] integerValue];
    }
    _currentElement=elementName;
}
-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string{
    string=[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    if([_currentElement isEqualToString:@"CDate"]){
        Model *model=[Model new];
        model.date=string;
        [_dataLists addObject:model];
    }

    if([_currentElement isEqualToString:@"Content"]){
        
        Model *model=_dataLists[_currentID-1];
        model.title=string;
    }
}
-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName{
    NSLog(@"遇到结束标签");
    _currentElement=nil;
    if([elementName isEqualToString:@"Note"]){
        _currentID=0;
    }

}
#pragma mark UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataLists.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier=@"cell";
    UITableViewCell *myCell=[tableView dequeueReusableCellWithIdentifier:identifier];
    if(myCell==nil){
        myCell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    }
    Model *model=self.dataLists[indexPath.row];
    myCell.textLabel.font=[UIFont systemFontOfSize:30];
    myCell.textLabel.text=model.title;
    myCell.detailTextLabel.font=[UIFont systemFontOfSize:20];
    myCell.detailTextLabel.text=model.date;
    return myCell;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
