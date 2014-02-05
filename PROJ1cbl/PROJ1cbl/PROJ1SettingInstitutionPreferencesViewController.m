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

@end

@implementation PROJ1SettingInstitutionPreferencesViewController



- (NSArray *)arrayOfInstitutionsPrefences
{
    
    return [NSArray arrayWithObjects:@"Crianças", @"Idosos", @"Animais", nil];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    [self.tableViewOfSettingInstitutionsPreferences setDelegate:self];
    [self.tableViewOfSettingInstitutionsPreferences setDataSource:self];
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
    
    cell.accessoryType = UITableViewCellAccessoryNone;
    
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
@end