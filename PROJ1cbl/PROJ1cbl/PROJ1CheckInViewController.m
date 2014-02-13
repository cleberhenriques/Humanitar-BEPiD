//
//  PROJ1CheckInViewController.m
//  PROJ1CheckIn
//
//  Created by Txai Wieser on 1/29/14.
//  Copyright (c) 2014 Txai Wieser. All rights reserved.
//

#import "PROJ1CheckInViewController.h"
#import "PROJ1Entidade.h"
#import "Parse/Parse.h"
@interface PROJ1CheckInViewController ()

@property (weak, nonatomic) IBOutlet MKMapView *mapViewCheckInShow;
@property (weak, nonatomic) IBOutlet UITableView *tableViewNearLocationsCheckIn;
@property (nonatomic) CLLocationManager *locationManager;
@property (nonatomic, strong) NSArray *arrayOfNearInstitutions; // usually 5 objets of type Entidade
@property double lat;
@property double longi;
@end

@implementation PROJ1CheckInViewController

- (IBAction)fecharModalAction {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)CheckInButtonClicked:(id)sender {
#warning REALIZAR CHECK-IN
    
    [self dismissViewControllerAnimated:YES completion:nil];

}


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
        PFQuery *query = [PFQuery queryWithClassName:@"Instituicoes"];
        [query whereKey:@"location" nearGeoPoint: [PFGeoPoint geoPointWithLatitude:-30.039823 longitude:-51.222652]];
        [query setLimit:4];
        [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
            if (!error) {
                NSMutableArray *arrayDeInstituicoesPerto = [[NSMutableArray alloc] init];
                for (PFObject *object in objects) {
                    PROJ1Entidade *institution = [[PROJ1Entidade alloc] init];
                    institution.nomeEntidade = [object objectForKey:@"name"];
                    PFGeoPoint *position = [object objectForKey:@"location"];
                    institution.latitude = [NSNumber numberWithDouble:position.latitude];
                    institution.longitude = [NSNumber numberWithDouble:position.longitude];
                    
                    NSLog(@"%@, %@",institution.latitude,institution.longitude);
                    [arrayDeInstituicoesPerto addObject:institution];
                }
                [self.mapViewCheckInShow addAnnotations:arrayDeInstituicoesPerto];
                [self.mapViewCheckInShow showAnnotations:arrayDeInstituicoesPerto animated:YES];
                self.arrayOfNearInstitutions = [[NSArray alloc]initWithArray:arrayDeInstituicoesPerto];
                [self.tableViewNearLocationsCheckIn reloadData];

            } else {
                NSLog(@"Error: %@ %@", error, [error userInfo]);
            }
        }];
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
   
}



- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.navigationController.navigationBar setBarTintColor: [UIColor colorWithRed:41/255. green:128/255. blue:185/255. alpha:1.0]];
    [self.tabBarController.tabBar setBarTintColor:[UIColor colorWithRed:41/255. green:128/255. blue:185/255. alpha:1.0]];
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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.mapViewCheckInShow showAnnotations:[NSArray arrayWithObject:[self.arrayOfNearInstitutions objectAtIndex:indexPath.row]] animated:YES];
    [[tableView cellForRowAtIndexPath:indexPath] setAccessoryType:UITableViewCellAccessoryCheckmark];
    
}


- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [[tableView cellForRowAtIndexPath:indexPath] setAccessoryType:UITableViewCellAccessoryNone];
    
}

- (void)startStandardUpdates
{
    // Create the location manager if this object does not
    // already have one.
    if (nil == _locationManager)
        _locationManager = [[CLLocationManager alloc] init];
    
    _locationManager.delegate = self;
    _locationManager.desiredAccuracy = kCLLocationAccuracyKilometer;
    
    // Set a movement threshold for new events.
    _locationManager.distanceFilter = 500; // meters
    
    [_locationManager startUpdatingLocation];
}

- (void)locationManager:(CLLocationManager *)manager
     didUpdateLocations:(NSArray *)locations {
    // If it's a relatively recent event, turn off updates to save power.
    CLLocation* location = [locations lastObject];
    NSDate* eventDate = location.timestamp;
    NSTimeInterval howRecent = [eventDate timeIntervalSinceNow];
    if (abs(howRecent) < 15.0) {
        // If the event is recent, do something with it.
        NSLog(@"latitude %+.6f, longitude %+.6f\n",
              location.coordinate.latitude,
              location.coordinate.longitude);
        self.lat = location.coordinate.latitude;
        self.longi = location.coordinate.longitude;
        [self buscaArrayDeInstituicoesPerto];
    }
}

@end
