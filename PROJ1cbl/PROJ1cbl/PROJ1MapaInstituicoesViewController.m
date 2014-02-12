//
//  PROJ1MapaInstituicoesViewController.m
//  PROJ1MapView
//
//  Created by Txai Wieser on 1/25/14.
//  Copyright (c) 2014 Txai Wieser. All rights reserved.
//

#import "PROJ1MapaInstituicoesViewController.h"
#import "PROJ1Entidade.h"
#import <Parse/Parse.h>


@interface PROJ1MapaInstituicoesViewController ()
@property (weak, nonatomic) IBOutlet MKMapView *instituicoesMapView;
@property (nonatomic) NSMutableArray *arrayOfInstitutions;
@property (nonatomic) int selectedMapViewFilter;
@end

@implementation PROJ1MapaInstituicoesViewController




- (NSArray *)arrayOfInstitutions
{
    if (!_arrayOfInstitutions) {
        //lazzy instanciation
         _arrayOfInstitutions = [[NSMutableArray alloc] initWithArray:[self buscaArrayDeInstituicoes]];
    }
    return _arrayOfInstitutions;
}


- (NSArray *)buscaArrayDeInstituicoes
{
    
    NSMutableArray *arrayDeInstituicoesTemporario = [[NSMutableArray alloc] init];
    
    ///////////////
    if (self.selectedMapViewFilter == 0) {
        ///////////////////////////////////////
        for (int i=0; i<7; i++) {
            PROJ1Entidade *umaInstituicaoTemporaria = [[PROJ1Entidade alloc] init];
            
            umaInstituicaoTemporaria.nomeEntidade = [NSString stringWithFormat:@"Instituicao %d",i+1];
            //umEventoTemporario.descricaoDoEvento = [NSString stringWithFormat:@"Descricao do evento de numero %d",i+1];
            NSArray *myArrayLat = [NSArray arrayWithObjects:@"51.219656", @"-30034634", @"-30032654", @"-30032624", @"-30042634", @"-30442634", @"-30033634", @"-30032629", nil];
            
            NSArray *myArrayLong = [NSArray arrayWithObjects:@"-30.034712", @"-51.250944", @"-51.220540", @"-51.225947", @"-51.220994", @"-51.210944", @"-51.220974", @"-51.220900", nil];
            
            umaInstituicaoTemporaria.latitude = [NSNumber numberWithDouble:[myArrayLat[i] doubleValue]];
            umaInstituicaoTemporaria.longitude = [NSNumber numberWithDouble:[myArrayLong[i] doubleValue]];
            
            [arrayDeInstituicoesTemporario addObject:umaInstituicaoTemporaria];
            
        }
        ///////////////////////////////////////
    }
    else {
        ///////////////////////////////////////
       
        PFQuery *query = [PFQuery queryWithClassName:@"Instituicoes"];
        [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
            if (!error) {
                // The find succeeded.
                // Do something with the found objects
                for (PFObject *object in objects) {
                    PROJ1Entidade *institution = [[PROJ1Entidade alloc] init];
                    
                    institution.nomeEntidade = [object objectForKey:@"name"];
                    PFGeoPoint *position = [object objectForKey:@"location"];
                    institution.latitude = [NSNumber numberWithDouble:position.latitude];
                    institution.longitude = [NSNumber numberWithDouble:position.longitude];
                    
                    NSLog(@"%@, %@",institution.latitude,institution.longitude);
                    [arrayDeInstituicoesTemporario addObject:institution];
                }
                [self.instituicoesMapView addAnnotations:arrayDeInstituicoesTemporario];
                [self.instituicoesMapView showAnnotations:arrayDeInstituicoesTemporario animated:YES];
            } else {
                NSLog(@"Error: %@ %@", error, [error userInfo]);
            }
        }];
    }
    
    return arrayDeInstituicoesTemporario;
    
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
	// Do any additional setup after loading the view
    self.instituicoesMapView.delegate = self;
    _arrayOfInstitutions = [[NSMutableArray alloc] initWithArray:[self buscaArrayDeInstituicoes]];

}



- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

    //headerViewSelectionButtons.backgroundColor = [UIColor greenColor];
#define MARGINTOPSEGMENT 28
#define MARGINSIDESEGMENT 56
    
    UISegmentedControl *segmentedMapButton = [[UISegmentedControl alloc] initWithItems:[NSArray arrayWithObjects:@"Interesses", @"Todas", nil]];
    segmentedMapButton.frame = CGRectMake(MARGINSIDESEGMENT, MARGINTOPSEGMENT, self.view.bounds.size.width-(2*MARGINSIDESEGMENT), 30);
    
    [segmentedMapButton addTarget:self action:@selector(didJustChangeOptionOnSegmentedControlMapView:) forControlEvents:UIControlEventValueChanged];
    [segmentedMapButton setSelectedSegmentIndex:0];
    
    [self.view addSubview:segmentedMapButton];

}



- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self updateInstituicoesMapViewAnnotations];

}



- (void)updateInstituicoesMapViewAnnotations
{
    [self.instituicoesMapView removeAnnotations:self.instituicoesMapView.annotations];
    [self.instituicoesMapView addAnnotations:self.arrayOfInstitutions];
    [self.instituicoesMapView showAnnotations:self.arrayOfInstitutions animated:YES];
}



- (void)didJustChangeOptionOnSegmentedControlMapView:(UISegmentedControl *)segmented
{
    self.selectedMapViewFilter = segmented.selectedSegmentIndex;
    //NSLog(@"%d", segmented.selectedSegmentIndex);
    self.arrayOfInstitutions = nil;
    [self updateInstituicoesMapViewAnnotations];
}


@end
