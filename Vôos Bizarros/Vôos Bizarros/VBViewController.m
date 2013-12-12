//
//  VBViewController.m
//  Vôos Bizarros
//
//  Created by Txai Wieser on 11/12/13.
//  Copyright (c) 2013 com.TDW.app. All rights reserved.
//

#import "VBViewController.h"
#import "VBSystemManager.h"
#import "VBSeatClass.h"
@interface VBViewController ()

@end

@implementation VBViewController

- (void)viewDidLoad
{
    NSLog(@"Inicializado com sucesso!");
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [self startApp];
    NSLog(@"Finalizado!");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) startApp
{
    VBSystemManager *res = [[VBSystemManager alloc] init];
    //Create airports
    [res createAirportWithName:@"DEN"];
    [res createAirportWithName:@"DFW"];
    [res createAirportWithName:@"LON"];
    [res createAirportWithName:@"JPN"];
    [res createAirportWithName:@"DE"]; //invalid
    [res createAirportWithName:@"DEH"];
    [res createAirportWithName:@"DEN"];
    [res createAirportWithName:@"NCE"];
    [res createAirportWithName:@"TRIord9"]; //invalid
    [res createAirportWithName:@"DEN"];
    //Create airlines
    [res createAirlineWithName:@"DELTA"];
    [res createAirlineWithName:@"AMER"];
    [res createAirlineWithName:@"JET"];
    [res createAirlineWithName:@"DELTA"];
    [res createAirlineWithName:@"SWEST"];
    [res createAirlineWithName:@"AMER"];
    [res createAirlineWithName:@"FRONT"];
    [res createAirlineWithName:@"FRONTIER"]; //invalid
    //Create flights
    [res createFlightWithName:@"DELTA" From:@"DEN" To:@"LON" OnYear:2009 OnMonth:10 OnDay:10 WithFlightID:@"123"];
    [res createFlightWithName:@"DELTA" From:@"DEN" To:@"DEH" OnYear:2009 OnMonth:8 OnDay:8 WithFlightID:@"567"];
    
    [res createFlightWithName:@"DELTA" From:@"DEN" To:@"NCE" OnYear:2010 OnMonth:9 OnDay:8 WithFlightID:@"567"]; //invalid
    [res createFlightWithName:@"JET" From:@"LON" To:@"DEN" OnYear:2009 OnMonth:5 OnDay:7 WithFlightID:@"123"];
    [res createFlightWithName:@"AMER" From:@"DEN" To:@"LON" OnYear:2010 OnMonth:10 OnDay:1 WithFlightID:@"123"];
    [res createFlightWithName:@"JET" From:@"DEN" To:@"LON" OnYear:2010 OnMonth:6 OnDay:10 WithFlightID:@"786"];
    [res createFlightWithName:@"JET" From:@"DEN" To:@"LON" OnYear:2009 OnMonth:1 OnDay:12 WithFlightID:@"909"];
    //Create sections
    [res createCategoryWithAirline:@"JET" OnFlightID:@"123" WithRows:2 Columns:2 AndSeatClass:Economica];
    [res createCategoryWithAirline:@"JET" OnFlightID:@"123" WithRows:1 Columns:3 AndSeatClass:Economica];
    [res createCategoryWithAirline:@"JET" OnFlightID:@"123" WithRows:2 Columns:3 AndSeatClass:Primeira];
    [res createCategoryWithAirline:@"DELTA" OnFlightID:@"123" WithRows:1 Columns:1 AndSeatClass:Executiva];
    [res createCategoryWithAirline:@"DELTA" OnFlightID:@"123" WithRows:1 Columns:2 AndSeatClass:Economica];
    [res createCategoryWithAirline:@"SWSERTT" OnFlightID:@"123" WithRows:5 Columns:5 AndSeatClass:Economica]; //invalid
    [res displaySystemDetails];
    [res findAvailableFlightsFrom: @"DEN" To:@"LON"];
    [res bookSeatOnAirline:@"DELTA" OnFlight:@"123" WithSeatClass:Executiva OnRow:1 AndColumn:'A'];
    [res bookSeatOnAirline:@"DELTA" OnFlight:@"123" WithSeatClass:Economica OnRow:1 AndColumn:'A'];
    [res bookSeatOnAirline:@"DELTA" OnFlight:@"123" WithSeatClass:Economica OnRow:1 AndColumn:'B'];
    [res bookSeatOnAirline:@"DELTA" OnFlight:@"123" WithSeatClass:Executiva OnRow:1 AndColumn:'A']; //already booked
    [res displaySystemDetails];
    [res findAvailableFlightsFrom:@"DEN" To:@"LON"];
}
@end
