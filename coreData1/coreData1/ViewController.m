//
//  ViewController.m
//  coreData1
//
//  Created by AppleUser on 16/3/9.
//  Copyright © 2016年 AppleUser. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
static NSString *const kLineEntityName=@"Line";
//static NSString *const kLineEntity=@"Line";
//static NSString *const kLineEntityName=@"Line";

@interface ViewController ()
@property (strong, nonatomic) IBOutletCollection(UITextField) NSArray *txt;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    AppDelegate *appDelegate=[[UIApplication sharedApplication] delegate];
 NSManagedObjectContext*context=   [appDelegate managedObjectContext];
    NSFetchRequest *request=[[NSFetchRequest alloc] initWithEntityName:kLineEntityName];
    NSError *erro;
    NSArray *objects=[context executeFetchRequest:request error:&erro];
    if(objects==nil){
        NSLog(@"erro");
    }
    for(NSManagedObject *temp in  objects){
        int lineNum;
    }
//    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(enterBackGround) name: object:nil];
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)enterBackGround{
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
