//
//  master.m
//  coreDate
//
//  Created by AppleUser on 16/3/10.
//  Copyright © 2016年 AppleUser. All rights reserved.
//

#import "master.h"
#import <CoreData/CoreData.h>
#import "AppDelegate.h"
@interface master ()<NSFetchedResultsControllerDelegate>
@property(nonatomic,strong)NSFetchedResultsController *fecthResultController;
@property(nonatomic,strong)NSManagedObjectContext *context;
@end

@implementation master
-(NSFetchedResultsController *)fecthResultController{
    if(_fecthResultController){
        return _fecthResultController;
    }
    AppDelegate *appDelegate=[UIApplication sharedApplication].delegate;
    NSManagedObjectContext *context=[appDelegate managedObjectContext];
    
    NSFetchRequest *fecthRequest=[[NSFetchRequest alloc] init];
    NSEntityDescription *entity=[NSEntityDescription entityForName:@"Time" inManagedObjectContext:context];
    [fecthRequest setEntity:entity];
    NSSortDescriptor *sortDescriptor=[NSSortDescriptor sortDescriptorWithKey:@"timeStamp" ascending:NO];
    NSArray *sortDescriptors=@[sortDescriptor];
    [fecthRequest setSortDescriptors:sortDescriptors];
    _fecthResultController=[[NSFetchedResultsController alloc] initWithFetchRequest:fecthRequest managedObjectContext:context sectionNameKeyPath:nil cacheName:nil];
    NSError *error;
    _fecthResultController.delegate=self;
    [_fecthResultController performFetch:&error];
    if(error){
        NSLog(@"erro:%@",error);
    }
    return _fecthResultController;
}
- (void)viewDidLoad {
    [super viewDidLoad];
   
//    self.navigationItem.leftBarButtonItem=self.editButtonItem;
       // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (IBAction)addAction:(UIBarButtonItem *)sender {
  
    NSManagedObjectContext *context=[self.fecthResultController managedObjectContext];
    NSEntityDescription *entity=self.fecthResultController.fetchRequest.entity;
    NSManagedObject *object=[NSEntityDescription insertNewObjectForEntityForName:[entity name] inManagedObjectContext:context];
    [object setValue:[NSDate date] forKey:@"timeStamp"];
    NSError *error;
    [context save:&error];
    if(error){
        NSLog(@"erro:%@",error);
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return self.fecthResultController.sections.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
   id<NSFetchedResultsSectionInfo> sectioninfo=self.fecthResultController.sections[section];
    return [sectioninfo numberOfObjects];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    NSManagedObject *object=[self.fecthResultController objectAtIndexPath:indexPath];
    cell.textLabel.text=[[object valueForKey:@"timeStamp"] description];
    // Configure the cell...
    
    return cell;
}

-(void)controller:(NSFetchedResultsController *)controller didChangeObject:(id)anObject atIndexPath:(NSIndexPath *)indexPath forChangeType:(NSFetchedResultsChangeType)type newIndexPath:(NSIndexPath *)newIndexPath{
    switch (type) {
        case NSFetchedResultsChangeInsert:
            [self.tableView insertRowsAtIndexPaths:@[newIndexPath] withRowAnimation:UITableViewRowAnimationLeft] ;
            break;
         case NSFetchedResultsChangeDelete:
            [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationLeft];
            break;
        default:
            break;
    }
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.fecthResultController.managedObjectContext deleteObject:[self.fecthResultController objectAtIndexPath:indexPath]];
                
    }
}


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    NSIndexPath *path=[self.tableView indexPathForSelectedRow];
    NSManagedObject *object=[self.fecthResultController objectAtIndexPath:path];
    [(( UINavigationController *)segue.destinationViewController).topViewController setValue:object forKey:@"delegate"];
}
@end
