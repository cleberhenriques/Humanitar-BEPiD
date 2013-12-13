//
//  VBMasterAirportsViewController.m
//  teste
//
//  Created by Txai Durigon Wieser on 12/12/13.
//  Copyright (c) 2013 Txai Wieser. All rights reserved.
//

#import "VBMasterAirportsViewController.h"

#import "VBDetailViewController.h"

@interface VBMasterAirportsViewController () {
    NSMutableArray *_objects;
    VBSystemManager *SystemManager;
    NSString *newAirport;
}
@end

@implementation VBMasterAirportsViewController

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
    self.navigationItem.rightBarButtonItem = addButton;
    
    
    NSLog(@"Inicializado com sucesso!");
    
    SystemManager = [[VBSystemManager alloc] init];

    [SystemManager createAirportWithName:@"DEN"];
    [SystemManager createAirportWithName:@"DFW"];
    [SystemManager createAirportWithName:@"LON"];
    [SystemManager createAirportWithName:@"JPN"];
    //[SystemManager createAirportWithName:@"DES"]; //invalid
    //[SystemManager createAirportWithName:@"DEH"];
    //[SystemManager createAirportWithName:@"DEN"];
    
    //[self startApp];
    NSLog(@"Finalizado!");
    
    _objects = [SystemManager getListOfAirports];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)insertNewObject:(id)sender
{
    
    
    
    
    
    newAirport = [[NSString alloc] init];
    
    UIAlertView *alert = [[UIAlertView alloc]
                           initWithTitle:@"Inserir Novo Aeroporto"
                           message:@"Digite a sigla do novo aeroporto"
                           delegate:self
                           cancelButtonTitle:@"Criar"
                           otherButtonTitles:nil];
    

    alert.alertViewStyle = UIAlertViewStylePlainTextInput;
    UITextField * alertTextField = [alert textFieldAtIndex:0];
    alertTextField.keyboardType = UIKeyboardTypeDefault;
    alertTextField.placeholder = @"Ex: CGH";
    
    [alert show];

    if (!_objects)
    {
        _objects = [[NSMutableArray alloc] init];
    }
    
    
    
    

}


- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    newAirport = [[alertView textFieldAtIndex:0] text];
    
    NSLog(@"%@", newAirport);
    //[SystemManager createAirlineWithName: [NSString stringWithFormat: @"%@", newAirport]];
    [SystemManager createAirportWithName:@"KKK"];
    [SystemManager createAirportWithName:@"HHH"];
    NSLog(@"%@", newAirport);
    NSLog(@"%@", [SystemManager getListOfAirports]);
    //_objects = [SystemManager getListOfAirports];
    NSLog(@"%@", _objects);
    [_objects insertObject:@"KKK" atIndex:0];
    
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];

#warning Crashing here!
    
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    
}




#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _objects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    

    VBAirport *oneairport = _objects[indexPath.row];
    
    cell.textLabel.text = [oneairport getName];
    
    return cell;
    
    
    
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [_objects removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}

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

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NSDate *object = _objects[indexPath.row];
        [[segue destinationViewController] setDetailItem:object];
    }
}

@end
