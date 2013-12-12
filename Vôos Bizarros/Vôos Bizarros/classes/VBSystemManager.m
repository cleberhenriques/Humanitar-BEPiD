//
//  VBSystemManager.m
//  Vôos Bizarros
//
//  Created by Felipe Delazeri Riffel on 11/12/13.
//  Copyright (c) 2013 com.TDW.app. All rights reserved.
//

#import "VBSystemManager.h"

@implementation VBSystemManager
{
    NSMutableArray *airports;
    NSMutableArray *airlines;
}

- (instancetype) init
{
    if (self = [super init])
    {
        airports = [[NSMutableArray alloc] init];
        airlines = [[NSMutableArray alloc] init];
    }
    return self;
}

- (BOOL) createAirlineWithName:(NSString *) name
{
    if([name length] <= 5)
    {
        VBAirline *airline = [[VBAirline alloc] init];
        for(VBAirline *al in airlines)
        {
			if([airline.nome isEqual:name])
				return NO;
        }
        
        airline.nome = name;
        [airlines addObject:airline];
        return YES;
    }
    
    return NO;
}

- (void) createAirportWithName:(NSString *) airportName
{
    VBAirport *airport = [[VBAirport alloc] initWithName:airportName];
    [airports addObject:airport];
}

- (void) bookSeatOnAirline:(NSString *) airlineName
                  OnFlight:(NSString *) flightID
             WithSeatClass:(VBSeatClass) seatClass
                  OnRow:(int) row
                    AndColumn:(char) col
{
    VBAirline *airline = [self findAirline:airlineName];
    VBFlight *flight = [airline getFlightWithId:flightID];
    //VBCategory *category = [flight ]
}

- (NSArray *) findAvailableFlightsFrom: (NSString *) origin
                                    To:(NSString *) destination
{
    NSMutableArray *flightCandidates = [[NSMutableArray alloc] init];
    for (VBAirline *airline in airlines)
    {
        for (VBFlight *flight in [airline flights])
        {
            if ([flight.from isEqualToString:origin] && [flight.from isEqualToString:destination])
            {
                if ([[flight schedule] laterDate:[NSDate date]])
                {
                    [flightCandidates addObject:flight];
                }
            }
        }
    }
    return [flightCandidates arrayByAddingObjectsFromArray:flightCandidates];
}

- (void) createFlightWithName:(NSString *) name
                         From:(NSString *) origem
                           To:(NSString *) destino
                       OnYear:(int) year
                      OnMonth:(int) month
                        OnDay:(int) day
                 WithFlightID:(NSString *) flightID
{
    VBAirline *air = [self findAirline:name];
	if(air == nil)
    {
		NSLog(@"Companhia nao existente.");
	}
	
	VBFlight *voo = [[VBFlight alloc] init];
	voo.orig = origem;
	voo.dest = destino;
	voo.year = year;
	voo.month = month;
	voo.day = day;
	voo.flID = flightID;
	
	[air addFlight: voo];
}

- (VBAirline *) findAirline:(NSString*) name
{
	for (VBAirline *comp in airlines) {
		if([name compare: comp.nome]){
			return comp;
		}
	}
	return nil;
}

- (void) createCategoryWithAirline:(NSString *) airline
                        OnFlightID:(NSString *) flightID
                          WithRows:(NSInteger) rows
                           Columns:(NSInteger) cols
                      AndSeatClass:(VBSeatClass) sc
{
    VBCategory *catAux = [[VBCategory alloc] init];
    
    catAux.rows = rows;
    catAux.cols = cols;
    catAux.sClass = sc;
    
    VBAirline *airLineAux = [self findAirline: airline];
    
    [airLineAux getFlightWithId:flightID];
}

- (void) displaySystemDetails
{
    
}

@end
