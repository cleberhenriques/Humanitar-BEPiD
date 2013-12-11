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

- (instancetype)init;
- (BOOL)createAirline:(NSString*) name;
- (void)createAirport:(NSString *)airportName;
- (void)createFlight:(NSString*)name
				   :(NSString*)origem
				   :(NSString*)destino
				   :(int) year
				   :(int) month
				   :(int) day
				   :(NSString*) flightID;
- (NSArray *) findAvailableFlights: (NSString *) origin : (NSString *) destination;
- (void)displaySystemDetails;
- (void)bookSeat:(NSString *) air
         flight:(NSString *)fl
      seatClass:(VBSeatClass) s
            row:(int) row
            col:(char) col;

@end
