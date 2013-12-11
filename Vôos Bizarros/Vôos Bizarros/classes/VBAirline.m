//
//  VBAirline.m
//  Vôos Bizarros
//
//  Created by Felipe Delazeri Riffel on 11/12/13.
//  Copyright (c) 2013 com.TDW.app. All rights reserved.
//

#import "VBAirline.h"

@implementation VBAirline
{
    NSMutableArray *flights;
}

- (instancetype) init
{
    if (self = [super init])
    {
        flights = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void) addFlight:(id) newFlight
{
    [flights addObject:newFlight];
}

- (VBFlight *) getFlight:(NSString *) idVoo
{
	for (VBFlight *tmp in flights) {
    
        if ([idVoo compare:tmp.flID])
        {
            return tmp;
        }
    }
    return nil;
}
@end
