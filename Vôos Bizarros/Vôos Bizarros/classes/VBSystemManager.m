//
//  VBSystemManager.m
//  Vôos Bizarros
//
//  Created by Felipe Delazeri Riffel on 11/12/13.
//  Copyright (c) 2013 com.TDW.app. All rights reserved.
//

#import "VBSystemManager.h"
#import "VBAirline.h"
#import "VBAirport.h"
#import "VBFlight.h"

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
    if(airport)
        [airports addObject:airport];
}

- (BOOL) bookSeatOnAirline:(NSString *) airlineName
                  OnFlight:(NSString *) flightID
             WithSeatClass:(VBSeatClass) seatClass
                     OnRow:(int) row
                 AndColumn:(char) col
{
    VBAirline *airline = [self findAirline:airlineName];
    VBFlight *flight = [airline getFlightWithId:flightID];
    VBCategory *category = [flight getCategoryWithSeatClass:seatClass];
    
    if (category != nil && [category seatReservedOnRow:row andCol:col])
    {
        return [category reserveSeatOnRow:row andCol:col];
        
    }
    return FALSE;
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
					   WithID:(NSString*) aFlightID;
{
    VBAirline *airline = [self findAirline:name];
	if(airline == nil)
    {
		NSLog(@"Airline does not exists.");
	}
	
	if(![self existsAirport:origem])
	{
		NSLog(@"Origin airport does not exists.");//fazer o metodo dar break
	}
	if(![self existsAirport:destino])
	{
		NSLog(@"Destination airport does not exists");
	}
	
	VBFlight *voo = [[VBFlight alloc] initWithDate:day Month:month AndYear:year];
	voo.from = origem;
	voo.to = destino;
	voo.flightId = aFlightID;
	
	[airline addFlight: voo];
}

- (VBAirline *) findAirline:(NSString *) name
{
	for (VBAirline *comp in airlines) {
		if([name compare: comp.nome]){
			return comp;
		}
	}
	return nil;
}

- (BOOL) existsAirport:(NSString *)airportName
{
	for (VBAirport *anAirport in airports) {
		if([anAirport.name localizedCaseInsensitiveCompare:airportName])
		{
			return YES;
		}
	}
	return NO;
}


- (void) createCategoryWithAirline:(NSString *) airline
                        OnFlightID:(NSString *) flightID
                          WithRows:(NSInteger) rows
                           Columns:(NSInteger) cols
                      AndSeatClass:(VBSeatClass) sc
{
    
    VBAirline *airLineAux = [self findAirline: airline];
    VBFlight *flightAux = [airLineAux getFlightWithId:flightID];

    VBCategory *catAux = [[VBCategory alloc] init];
    
    catAux.rows = rows;
    catAux.cols = cols;
    catAux.sClass = sc;
    
    [flightAux addCategory:catAux];
}

- (void) displaySystemDetails
{
    NSLog(@"System Details.");
	
	//Show registered airports
	NSLog(@"Registered airports:");
	NSMutableString *airportsLog = [[NSMutableString alloc] init];
	for (VBAirport *airport in airports)
	{
		[airportsLog appendString:airport.name];
		[airportsLog appendString:@"\n"];
	}
	NSLog(@"%@",airportsLog);
	
	//Show registered airlines and flights.
	NSLog(@"Registered airlines:");
	NSMutableString *airlinesLog = [[NSMutableString alloc] init];
	for (VBAirline *airline in airlines)
	{
		[airlinesLog appendString:airline.nome];
		[airlinesLog appendString:@":\n"];
        
		for (VBFlight *flight in airline.flights)
		{
			[airlinesLog appendString:flight.description];
			[airlinesLog appendString:@"\n"];
		}
	}
	NSLog(@"%@",airlinesLog);
}

@end
