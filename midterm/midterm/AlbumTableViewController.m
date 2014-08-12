//
//  AlbumTableViewController.m
//  midterm
//
//  Created by Yurim Jin on 2014. 8. 12..
//  Copyright (c) 2014년 Yurim Jin. All rights reserved.
//

#import "AlbumTableViewController.h"
#import "MyModel.h"
#import "DetailViewController.h"

@interface AlbumTableViewController ()
@property (nonatomic, strong) MyModel *myModel;
@property (nonatomic, strong) NSMutableArray *jsonDicS;

@end

@implementation AlbumTableViewController

- (void) myEventHandler:(NSNotification *) notif {
   
    //    NSLog(@"myNum: %@", myNum);
    
    [self.tableView reloadData];
}


-(void) letsOrder {
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    NSMutableDictionary *jsonDic = _myModel.jsonInfo[indexPath.row];
    _jsonDicS = _myModel.jsonInfo;
    NSSortDescriptor *nameSorter = [[NSSortDescriptor alloc] initWithKey:@"date" ascending:YES];
    NSArray *sortDescriptors = @[nameSorter];
    NSArray *sortedPersonArray = [_jsonDicS sortedArrayUsingDescriptors:sortDescriptors];
    _myModel.jsonInfo = sortedPersonArray;
    [self.tableView reloadData];
    NSLog(@"tt: %@",sortedPersonArray);
}



-(BOOL)canBecomeFirstResponder {
    return YES;
}

- (void) viewDidAppear:(BOOL)animated {
    [self becomeFirstResponder];
    [super viewDidAppear:animated];
}

- (void) viewDidDisappear:(BOOL)animated {
    [self resignFirstResponder];
    [super viewDidDisappear:animated];
}

- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    if (event.subtype == UIEventSubtypeMotionShake) {
        _myModel.jsonInfo = _jsonDicS;
        [self.tableView reloadData];
        
    }
    [super motionEnded:motion withEvent:event];
}


- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSNotificationCenter *notiCenter = [NSNotificationCenter defaultCenter];
    [notiCenter addObserver:self selector:@selector(myEventHandler:) name:@"myInit" object:nil];
    
    
    _myModel = [[MyModel alloc] init];
    [_myModel myObserver];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"order"     style:UIBarButtonItemStyleBordered target:self action:@selector(letsOrder)];
    

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.myModel.jsonInfo count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AlbumCell" forIndexPath:indexPath];
    NSDictionary *jsonDic = self.myModel.jsonInfo[indexPath.row];
    cell.textLabel.text = [jsonDic valueForKey:@"title"];
    cell.detailTextLabel.text = [jsonDic valueForKey:@"date"];
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([[segue identifier] isEqualToString:@"ShowAlbumDetails"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NSDictionary *jsonDic = _myModel.jsonInfo[indexPath.row];
        [[segue destinationViewController] setDetailItem:jsonDic];
        
    }
}

@end
