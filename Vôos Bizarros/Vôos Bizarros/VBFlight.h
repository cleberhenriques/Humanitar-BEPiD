//
//  VBFlight.h
//  Vôos Bizarros
//
//  Created by Leonardo Gubert on 11/12/13.
//  Copyright (c) 2013 com.TDW.app. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VBCategory.h"

@interface VBFlight : NSObject

@property NSMutableArray *categories;
@property NSString *flID;
@property NSString *orig;
@property NSString *dest;
@property int year;
@property int month;
@property int day;

- (BOOL) addCategory:(VBCategory*) category;

@end
