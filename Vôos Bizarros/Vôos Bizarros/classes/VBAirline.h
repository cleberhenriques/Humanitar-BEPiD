//
//  VBAirline.h
//  Vôos Bizarros
//
//  Created by Felipe Delazeri Riffel on 11/12/13.
//  Copyright (c) 2013 com.TDW.app. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VBFlight.h"

@interface VBAirline : NSObject

@property NSString *nome;
@property NSMutableArray *flights;

- (void) addFlight:(VBFlight *) newFlight;
- (VBFlight *) getFlightWithId:(NSString *) idVoo;

@end
