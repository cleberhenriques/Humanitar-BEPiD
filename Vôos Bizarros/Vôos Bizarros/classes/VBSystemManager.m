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

-(instancetype)init
{
    if (self = [super init])
    {
        airports = [[NSMutableArray alloc]init];
        airlines = [[NSMutableArray alloc]init];
    }
    return self;
}

-(BOOL)createAirline:(NSString*) name
{
    if([name length] <= 5)
    {
        VBAirline* airline = [[VBAirline alloc] init];
        for(VBAirline* al in airlines)
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

-(void)createAirport:(NSString *)airportName
{
    VBAirport *airport = [[VBAirport alloc]initWithName:airportName];
    [airports addObject:airport];
}

-(void)bookSeat:(NSString *)air flight:(NSString *)fl seatClass:(VBSeatClass)s row:(int)row col:(char)col
{
    
}

- (NSArray *) findAvailableFlights: (NSString *) origin : (NSString *) destination
{
    
    
    return nil;
}

-(void)createFlight:(NSString *)name :(NSString *)origem :(NSString *)destino :(int)year :(int)month :(int)day :(NSString *)flightID
{
	
    
	
}

@end
