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

@property (nonatomic, strong) NSArray *arrayOfNearInstitutions; // usually 5 objets of type Entidade

@end

@implementation PROJ1CheckInViewController


- (NSArray *)arrayOfNearInstitutions
{
    if (!_arrayOfNearInstitutions) {
        _arrayOfNearInstitutions = [[NSArray alloc] initWithArray:[self buscaArrayDeInstituicoesPerto]];
    }
    return _arrayOfNearInstitutions;
}


- (NSArray *)buscaArrayDeInstituicoesPerto
{
    NSMutableArray *arrayTemporarioDeInstituicoesPerto = [[NSMutableArray alloc] init];
    ///////////////////////////////////////////
    
    for (int i=0; i<5; i++) {
        PROJ1Entidade *umaInstituicaoTemporaria = [[PROJ1Entidade alloc] init];
        
        
        NSArray *myArrayLat = [NSArray arrayWithObjects:@"51.219656", @"-30.034634", @"-30.032654", @"-30.442634", @"-30.032629", nil];
        
        NSArray *myArrayLong = [NSArray arrayWithObjects:@"-30.034712", @"-51.250944", @"-51.220540", @"-51.210944", @"-51.220900", nil];
        
        
        
        umaInstituicaoTemporaria.nomeEntidade = [NSString stringWithFormat:@"Instituicao %d",i+1];
        umaInstituicaoTemporaria.descricaoEntidade = [NSString stringWithFormat:@"Descricao de numero %d",i+1];
        umaInstituicaoTemporaria.codTipoEntidade = [NSNumber numberWithDouble:[myArrayLat[i] doubleValue]];
        NSLog(@"%d",i);
        
        umaInstituicaoTemporaria.latitude = [NSNumber numberWithDouble:[myArrayLat[i] doubleValue]];
        umaInstituicaoTemporaria.longitude = [NSNumber numberWithDouble:[myArrayLong[i] doubleValue]];
        
        [arrayTemporarioDeInstituicoesPerto addObject:umaInstituicaoTemporaria];
        
    }
    //////////////////////////////////////////
    return arrayTemporarioDeInstituicoesPerto;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return self.tableViewNearLocationsCheckIn.bounds.size.height/self.arrayOfNearInstitutions.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return self.arrayOfNearInstitutions.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifier = @"NearInstitutionsCheckInCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    
    PROJ1Entidade *entidadeDaCell = self.arrayOfNearInstitutions[indexPath.row];
    cell.textLabel.text = entidadeDaCell.nomeEntidade;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%f", [entidadeDaCell.codTipoEntidade doubleValue] ];
    
    //[cell.textLabel setFont:[UIFont fontWithName:@"HelveticaNeue-UltraLight" size:30]];
    //[cell.textLabel setFont:[UIFont fontWithName:@"HelveticaNeue-UltraLight" size:30]];
    
    
    return cell;
}


- (void)updateInstituicoesMapViewAnnotations
{
    [self.mapViewCheckInShow removeAnnotations:self.mapViewCheckInShow.annotations];
    [self.mapViewCheckInShow addAnnotations:self.arrayOfNearInstitutions];
    [self.mapViewCheckInShow showAnnotations:self.arrayOfNearInstitutions animated:YES];
    [self.tableViewNearLocationsCheckIn reloadData];
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
    
    
    // Configurando TableView
    [self.tableViewNearLocationsCheckIn setDelegate:self];
    [self.tableViewNearLocationsCheckIn setDataSource:self];
    [self.tableViewNearLocationsCheckIn setBounces:NO];
    [self.tableViewNearLocationsCheckIn setAllowsSelection:YES];
    
    // Configurando MapView
    [self.mapViewCheckInShow setDelegate:self];
    [self.mapViewCheckInShow setZoomEnabled:NO];
    [self.mapViewCheckInShow setScrollEnabled:NO];
    [self.mapViewCheckInShow setRotateEnabled:NO];
    [self updateInstituicoesMapViewAnnotations];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
