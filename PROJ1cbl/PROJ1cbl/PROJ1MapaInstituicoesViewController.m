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

- (void)buscaArrayDeInstituicoes
{
    if (self.selectedMapViewFilter == 0) {
        [self loadAnnotationsFromParse:YES];
    }else{
        [self loadAnnotationsFromParse:NO];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.instituicoesMapView.delegate = self;
    [self buscaArrayDeInstituicoes];

}

-(void) loadAnnotationsFromParse:(BOOL)filter{
    [self.instituicoesMapView removeAnnotations:self.instituicoesMapView.annotations];
    PFQuery *query = [PFQuery queryWithClassName:@"Instituicoes"];
    if(filter){
        [query whereKey:@"tipo" containedIn:[[PFUser currentUser] objectForKey:@"entidadePref"]];
    }
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            NSMutableArray *arrayDeInstituicoesTemporario = [[NSMutableArray alloc] init];
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

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
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
}

- (void)didJustChangeOptionOnSegmentedControlMapView:(UISegmentedControl *)segmented
{
    self.selectedMapViewFilter = segmented.selectedSegmentIndex;
    self.arrayOfInstitutions = nil;
    [self buscaArrayDeInstituicoes];
}


@end
