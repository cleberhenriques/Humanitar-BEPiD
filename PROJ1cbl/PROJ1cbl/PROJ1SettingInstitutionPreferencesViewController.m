//
//  PROJ1SettingInstitutionPreferencesViewController.m
//  PROJ1cbl
//
//  Created by Txai Wieser on 05/02/14.
//  Copyright (c) 2014 com.TDW.app. All rights reserved.
//

#import "PROJ1SettingInstitutionPreferencesViewController.h"
#import <Parse/Parse.h>

@interface PROJ1SettingInstitutionPreferencesViewController ()

@property (nonatomic) NSArray *arrayOfInstitutionsPrefences;
@property (weak, nonatomic) IBOutlet UITableView *tableViewOfSettingInstitutionsPreferences;
@property (strong, nonatomic) NSMutableArray *listaDePreferencias;

@end


@implementation PROJ1SettingInstitutionPreferencesViewController


- (NSMutableArray *)listaDePreferencias
{
    if (!_listaDePreferencias) {
        
        _listaDePreferencias = [[NSMutableArray alloc] init];
        _listaDePreferencias = [[PFUser currentUser] objectForKey:@"entidadePref"];
    }
    return _listaDePreferencias;
}


- (NSArray *)arrayOfInstitutionsPrefences
{
    if (!_arrayOfInstitutionsPrefences) {
        
        _arrayOfInstitutionsPrefences = [[NSMutableArray alloc] init];
        
    }
    return _arrayOfInstitutionsPrefences;
}
         

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    [self.tableViewOfSettingInstitutionsPreferences setDelegate:self];
    [self.tableViewOfSettingInstitutionsPreferences setDataSource:self];
    
    [self.navigationController.navigationBar setBarTintColor: [UIColor colorWithRed:41/255. green:128/255. blue:185/255. alpha:1.0]];
    
    // retorna as instituições do Parse
    PFQuery *listar = [PFQuery queryWithClassName:@"TipoInstituicao"];
    [listar orderByDescending:@"Instituicao"];
    listar.limit = 100;
    
    
    __block NSMutableArray *arrayTemporarioBlock = [[NSMutableArray alloc] init];
    [listar findObjectsInBackgroundWithBlock:^(NSArray *result, NSError *error) {
        
        for (PFObject *resultado in result) {
            PFObject *post = resultado[@"Instituicao"];
            NSLog(@"%@", post);
            [arrayTemporarioBlock addObject:[NSString stringWithFormat:@"%@", post]];
        }
        
    }];
    NSLog(@"%@", arrayTemporarioBlock);
    self.arrayOfInstitutionsPrefences = arrayTemporarioBlock;
    
    
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

-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView cellForRowAtIndexPath:indexPath].accessoryType = UITableViewCellAccessoryNone;
    if([self.listaDePreferencias containsObject:self.arrayOfInstitutionsPrefences[indexPath.row]])
    {
        [self.listaDePreferencias removeObject:self.arrayOfInstitutionsPrefences[indexPath.row]];
    }
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView cellForRowAtIndexPath:indexPath].accessoryType = UITableViewCellAccessoryCheckmark;
    if(![self.listaDePreferencias containsObject:self.arrayOfInstitutionsPrefences[indexPath.row]])
    {
        [self.listaDePreferencias addObject:self.arrayOfInstitutionsPrefences[indexPath.row]];
    }
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.arrayOfInstitutionsPrefences.count;
}

- (IBAction)saveButtonAction:(id)sender {

    // salva preferências do usuário
    [[PFUser currentUser]  setObject:self.listaDePreferencias forKey:@"entidadePref"];
    [[PFUser currentUser] saveInBackground];

    [self dismissViewControllerAnimated:YES completion:nil];
    
}
@end