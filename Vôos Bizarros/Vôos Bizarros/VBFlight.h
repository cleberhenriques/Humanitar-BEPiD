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

@property (readonly) NSMutableArray *categories;
@property NSString *flightId;
@property NSString *from;
@property NSString *to;
@property int year;
@property int month;
@property int day;
@property NSDate *schedule;

- (instancetype) initWithDate: (NSInteger) day
                        Month: (NSInteger) month
                      AndYear: (NSInteger) year;
- (BOOL) addCategory:(VBCategory*) category;
- (VBCategory *)getCategoryWithSeatClass:(VBSeatClass) seatClass;

@end
