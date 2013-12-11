//
//  VBSystemManager.h
//  Vôos Bizarros
//
//  Created by Felipe Delazeri Riffel on 11/12/13.
//  Copyright (c) 2013 com.TDW.app. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VBAirline.h"
#import "VBAirport.h"
#import "VBFlight.h"

@interface VBSystemManager : NSObject

-(VBAirport *)createAirport;
-(VBAirline *)createAirline;
-(VBFlight *)createFlight;
-(VBFlight *)findAvailableFlights:(NSString *)flID;
-(void)bookSeat;
-(void)displaySystemDetails;

@end
