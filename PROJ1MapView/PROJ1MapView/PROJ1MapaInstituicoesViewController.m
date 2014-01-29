//
//  PROJ1MapaInstituicoesViewController.m
//  PROJ1MapView
//
//  Created by Txai Wieser on 1/25/14.
//  Copyright (c) 2014 Txai Wieser. All rights reserved.
//

#import "PROJ1MapaInstituicoesViewController.h"
#import "PROJ1Instituicoes.h"

@interface PROJ1MapaInstituicoesViewController ()
@property (weak, nonatomic) IBOutlet MKMapView *instituicoesMapView;
@property (nonatomic) NSArray *arrayOfInstitutions;
@property (nonatomic) int selectedMapViewFilter;
@end

@implementation PROJ1MapaInstituicoesViewController


- (NSArray *)arrayOfInstitutions
{
    if (!_arrayOfInstitutions) {
        //lazzy instanciation
         _arrayOfInstitutions = [[NSArray alloc] initWithArray:[self buscaArrayDeInstituicoes]];
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
            PROJ1Instituicoes *umaInstituicaoTemporaria = [[PROJ1Instituicoes alloc] init];
            
            umaInstituicaoTemporaria.nomeDaInstituicao = [NSString stringWithFormat:@"Instituicao %d",i+1];
            //umEventoTemporario.descricaoDoEvento = [NSString stringWithFormat:@"Descricao do evento de numero %d",i+1];
            NSLog(@"%d",i);
            NSArray *myArrayLat = [NSArray arrayWithObjects:@"51.219656", @"-30034634", @"-30032654", @"-30032624", @"-30042634", @"-30442634", @"-30033634", @"-30032629", nil];
            
            NSArray *myArrayLong = [NSArray arrayWithObjects:@"-30.034712", @"-51.250944", @"-51.220540", @"-51.225947", @"-51.220994", @"-51.210944", @"-51.220974", @"-51.220900", nil];
            
            umaInstituicaoTemporaria.latitudeDaInstituicao = [NSNumber numberWithDouble:[myArrayLat[i] doubleValue]];
            umaInstituicaoTemporaria.longitudeDaInstituicao = [NSNumber numberWithDouble:[myArrayLong[i] doubleValue]];
            NSLog(@"%@",umaInstituicaoTemporaria.latitudeDaInstituicao);

            
            [arrayDeInstituicoesTemporario addObject:umaInstituicaoTemporaria];
            
        }
        ///////////////////////////////////////
    }
    else {
        ///////////////////////////////////////
       
        for (int i=0; i<4; i++) {
            PROJ1Instituicoes *umaInstituicaoTemporaria = [[PROJ1Instituicoes alloc] init];
            
            umaInstituicaoTemporaria.nomeDaInstituicao = [NSString stringWithFormat:@"Instituicao %d",i+1];
            //umEventoTemporario.descricaoDoEvento = [NSString stringWithFormat:@"Descricao do evento de numero %d",i+1];
            NSLog(@"%d",i);
            NSArray *myArrayLat = [NSArray arrayWithObjects:@"-30.032634", @"-30.034634", @"-30.042634", @"-30.034634", @"-30.032624", nil];
            
            NSArray *myArrayLong = [NSArray arrayWithObjects:@"-51.225944", @"-51.220994", @"-51.210944", @"-51.220974", @"-51.220900", nil];
            
            umaInstituicaoTemporaria.latitudeDaInstituicao = [NSNumber numberWithDouble:[myArrayLat[i] doubleValue]];
            umaInstituicaoTemporaria.longitudeDaInstituicao = [NSNumber numberWithDouble:[myArrayLong[i] doubleValue]];
            NSLog(@"%@",umaInstituicaoTemporaria.latitudeDaInstituicao);
            
            [arrayDeInstituicoesTemporario addObject:umaInstituicaoTemporaria];
            
        }
        
        ///////////////////////////////////////
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
    NSLog(@"didUP");
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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//
//- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation
//{
//    
//}


//- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control;


@end
