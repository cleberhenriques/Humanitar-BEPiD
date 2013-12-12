//
//  VBSystemManager.h
//  Vôos Bizarros
//
//  Created by Felipe Delazeri Riffel on 11/12/13.
//  Copyright (c) 2013 com.TDW.app. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import "VBSeatClass.h"
#import "VBCategory.h"

@interface VBSystemManager : NSObject

- (BOOL) createAirlineWithName:(NSString *) name;
- (void) createAirportWithName:(NSString *) airportName;
- (void) createFlightWithName:(NSString *) name
				   From:(NSString *) origem
				   To:(NSString *) destino
				   OnYear:(int) year
				   OnMonth:(int) month
				   OnDay:(int) day
			WithFlightID:(NSString*) aFlightID;
- (NSArray *) findAvailableFlightsFrom: (NSString *) origin
                                    To: (NSString *) destination;
- (void) displaySystemDetails;
- (BOOL) bookSeatOnAirline:(NSString *) airline
                  OnFlight:(NSString *)flightID
             WithSeatClass:(VBSeatClass) seatClass
                     OnRow:(int) row
                 AndColumn:(char) col;
- (void) createCategoryWithAirline:(NSString *) airline
                        OnFlightID:(NSString *) flightID
                          WithRows:(NSInteger) rows
                           Columns:(NSInteger) cols
                      AndSeatClass:(VBSeatClass) sc;

@end
