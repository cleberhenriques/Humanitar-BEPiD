//
//  VBAirline.m
//  Vôos Bizarros
//
//  Created by Felipe Delazeri Riffel on 11/12/13.
//  Copyright (c) 2013 com.TDW.app. All rights reserved.
//

#import "VBAirline.h"

@implementation VBAirline

- (instancetype) init
{
    if (self = [super init])
    {
        _flights = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void) addFlight:(id) newFlight
{
    [_flights addObject:newFlight];
}

- (VBFlight *) getFlightWithId:(NSString *) idVoo
{
	for (VBFlight *flight in _flights)
    {
        if ([idVoo compare:flight.flID])
        {
            return flight;
        }
    }
    return nil;
}
@end
