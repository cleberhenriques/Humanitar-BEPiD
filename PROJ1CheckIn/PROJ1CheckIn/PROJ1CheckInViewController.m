//
//  PROJ1CheckInViewController.m
//  PROJ1CheckIn
//
//  Created by Txai Wieser on 1/29/14.
//  Copyright (c) 2014 Txai Wieser. All rights reserved.
//

#import "PROJ1CheckInViewController.h"
#import "PROJ1Entidade.h"

@interface PROJ1CheckInViewController ()

@property (weak, nonatomic) IBOutlet MKMapView *mapViewCheckInShow;
@property (weak, nonatomic) IBOutlet UITableView *tableViewNearLocationsCheckIn;

@property (nonatomic) NSArray *arrayOfNearInstitutions; // usually 5 objets of type Entidade

@end

@implementation PROJ1CheckInViewController


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return self.arrayOfNearInstitutions.count   ;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifier = @"NearInstitutionsCheckInCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    
    PROJ1Entidade *entidadeDaCell = self.arrayOfNearInstitutions[indexPath.row];
    cell.textLabel.text = entidadeDaCell.nomeEntidade;
    cell.detailTextLabel.text = entidadeDaCell.nomeEntidade;
    
    [cell.textLabel setFont:[UIFont fontWithName:@"HelveticaNeue-UltraLight" size:30]];
    [cell.textLabel setFont:[UIFont fontWithName:@"HelveticaNeue-UltraLight" size:30]];
    
    //ADICIONA IMAGEM NA CELULA
    
    return cell;

    
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
    [self.navigationController.navigationBar setBarTintColor: [UIColor colorWithRed:0.11 green:0.47 blue:0.58 alpha:1.0]];
    [self.tabBarController.tabBar setBarTintColor:[UIColor colorWithRed:0.11 green:0.47 blue:0.58 alpha:1.0]];
	// Do any additional setup after loading the view.
    
    self.mapViewCheckInShow.delegate = self;
    self.tableViewNearLocationsCheckIn.delegate = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
