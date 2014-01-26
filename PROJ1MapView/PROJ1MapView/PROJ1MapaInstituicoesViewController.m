//
//  PROJ1MapaInstituicoesViewController.m
//  PROJ1MapView
//
//  Created by Txai Wieser on 1/25/14.
//  Copyright (c) 2014 Txai Wieser. All rights reserved.
//

#import "PROJ1MapaInstituicoesViewController.h"

@interface PROJ1MapaInstituicoesViewController ()
@property (weak, nonatomic) IBOutlet MKMapView *instituicoesMapView;

@end

@implementation PROJ1MapaInstituicoesViewController

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
