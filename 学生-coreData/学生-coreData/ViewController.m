//
//  ViewController.m
//  学生-coreData
//
//  Created by AppleUser on 16/3/9.
//  Copyright © 2016年 AppleUser. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
static NSString *const kEntityName=@"Stu";
static NSString *const kNum=@"num";
static NSString *const kClassName=@"ban";
static NSString *const kName=@"name";
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *txtNum;
@property (weak, nonatomic) IBOutlet UITextField *txtClassName;
@property (weak, nonatomic) IBOutlet UITextField *txtName;
@property (weak, nonatomic) IBOutlet UIButton *btnNum;
@property (weak, nonatomic) IBOutlet UIButton *btnLast;
@property (weak, nonatomic) IBOutlet UIButton *btnNext;
@property (weak, nonatomic) IBOutlet UIButton *btnAdd;
@property (weak, nonatomic) IBOutlet UIButton *btnDelete;
@property(nonatomic,strong)NSArray *students;

@end

@implementation ViewController{
    int index;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadViews];
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)loadViews {
   NSManagedObject * stu= [self.students firstObject];
    self.txtNum.text=[[stu valueForKey:kNum] description];
    self.txtClassName.text=[stu valueForKey:kClassName];
    self.txtName.text=[stu valueForKey:kName];
    index=0;
    self.btnLast.enabled=(index!=0);
    self.btnNext.enabled=(index!=self.students.count-1);
};
-(NSArray*)students{
        _students=[self queryAll];
        if(_students==nil){
            _students=[NSArray new];
        }
  
    return _students;
}
-(NSArray *)queryByNum:(int)num{
    AppDelegate * appDelegate = [UIApplication sharedApplication].delegate;
    
    NSManagedObjectContext * context = [appDelegate managedObjectContext];
    
    
    NSError * error;
    //以实体名建立提取请求
    NSFetchRequest * request = [[NSFetchRequest alloc]initWithEntityName:kEntityName];
    
    //谓词，
    NSPredicate * pred = [NSPredicate predicateWithFormat:@"%K=%d",kNum,num];
    //提取请求中加入谓词
    [request setPredicate:pred];
    
    
    NSArray * objects = [context executeFetchRequest:request error:&error];
    
    if (objects == nil) {
        NSLog(@"error");
    }
    return objects;
}
-(NSArray *)queryAll{
  
    AppDelegate * appDelegate = [UIApplication sharedApplication].delegate;
    
    //托管对象上下文
    NSManagedObjectContext * context = [appDelegate managedObjectContext];
    
    //根据实体名建立提取请求
    NSFetchRequest * request = [[NSFetchRequest alloc]initWithEntityName:kEntityName];
    
    
    NSError * error;
    //执行提取请求
    NSArray * objects = [context executeFetchRequest:request error:&error];
    
    if (objects == nil) {
        NSLog(@"there was an error");
    }

    return objects;
}
- (IBAction)btnNumAction:(UIButton *)sender {
   NSArray *stu= [self queryByNum:[self.txtNum.text intValue]];
    NSLog(@"count:%ld",stu.count);
  

    NSManagedObject *temp=[stu lastObject];
    self.txtClassName.text=[temp valueForKey:kClassName];
       self.txtName.text=[temp valueForKey:kName];
}
- (IBAction)btnLastAction:(id)sender {
    index--;
    [self showStu];
}
- (IBAction)btnNextAction:(id)sender {
    index++;
    [self showStu];
}
-(void)showStu{
    NSManagedObject * stu= self.students[index];

    self.txtNum.text=[[stu valueForKey:kNum] description];
    self.txtClassName.text=[stu valueForKey:kClassName];
    self.txtName.text=[stu valueForKey:kName];
    self.btnLast.enabled=(index!=0);
    self.btnNext.enabled=(index!=self.students.count-1);

}
- (IBAction)btnAddAction:(id)sender {
    AppDelegate * appDelegate = [UIApplication sharedApplication].delegate;
    NSArray * objects =[self queryByNum:[_txtNum.text intValue]];
    NSLog(@"objects-count:%ld",objects.count);
    NSManagedObject * student = nil;
    //托管对象上下文
    NSManagedObjectContext * context = [appDelegate managedObjectContext];
    if ([objects count]>0) {//如果行号＝i的托管对象存在
        student = [objects objectAtIndex:0];
        
    }else{//不存在行号＝i的托管对象
        
        //插入一个新的托管对象，到托管对象上下文
        student = [NSEntityDescription insertNewObjectForEntityForName:kEntityName inManagedObjectContext:context];
        
        
        
    }
    [student setValue:@([self.txtNum.text intValue]) forKey:kNum];
    [student setValue:self.txtClassName.text forKey:kClassName];
    [student setValue:self.txtName.text forKey:kName];
    [appDelegate saveContext];
    index=self.students.count-1;
    self.btnNext.enabled=NO;
    self.btnLast.enabled=YES;
}
- (IBAction)btnDeleteAction:(id)sender {
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
