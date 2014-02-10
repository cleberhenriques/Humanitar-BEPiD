//
//  PROJ1SettingInstitutionPreferencesViewController.m
//  PROJ1cbl
//
//  Created by Txai Wieser on 05/02/14.
//  Copyright (c) 2014 com.TDW.app. All rights reserved.
//

#import "PROJ1SettingInstitutionPreferencesViewController.h"

@interface PROJ1SettingInstitutionPreferencesViewController ()

@property (nonatomic) NSArray *arrayOfInstitutionsPrefences;
@property (weak, nonatomic) IBOutlet UITableView *tableViewOfSettingInstitutionsPreferences;
@property (strong, nonatomic) NSMutableArray *listaDePreferencias;

@end


@implementation PROJ1SettingInstitutionPreferencesViewController


- (NSMutableArray *)listaDePreferencias
{
    return [NSMutableArray arrayWithObjects:@"Crianças", nil];
}
- (NSArray *)arrayOfInstitutionsPrefences
{
    
    return [NSArray arrayWithObjects:@"Crianças", @"Idosos", @"Animais", nil];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    [self.tableViewOfSettingInstitutionsPreferences setDelegate:self];
    [self.tableViewOfSettingInstitutionsPreferences setDataSource:self];
    
    [self.navigationController.navigationBar setBarTintColor: [UIColor colorWithRed:41/255. green:128/255. blue:185/255. alpha:1.0]];
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"InstitutionsPreferencesTableView";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    
    cell.textLabel.text = self.arrayOfInstitutionsPrefences[indexPath.row];
    
    
    if ([self.listaDePreferencias containsObject:self.arrayOfInstitutionsPrefences[indexPath.row]]) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }else
    {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    return cell;
}

-(NSIndexPath *)tableView:(UITableView *)tableView willDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView cellForRowAtIndexPath:indexPath].accessoryType = UITableViewCellAccessoryNone;
    return indexPath;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView cellForRowAtIndexPath:indexPath].accessoryType = UITableViewCellAccessoryCheckmark;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.arrayOfInstitutionsPrefences.count;
}
- (IBAction)saveButtonAction:(id)sender {
    
#warning SALVAR INTERESSES
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}
@end