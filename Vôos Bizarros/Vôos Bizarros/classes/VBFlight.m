//
//  VBFlight.m
//  Vôos Bizarros
//
//  Created by Leonardo Gubert on 11/12/13.
//  Copyright (c) 2013 com.TDW.app. All rights reserved.
//

#import "VBFlight.h"

@implementation VBFlight

- (instancetype) initWithDate:(NSInteger) day
                        Month:(NSInteger) month
                      AndYear:(NSInteger) year
{
    if (self = [super init])
    {
        NSCalendar *calendar = [[NSCalendar alloc] init];
        NSDateComponents *components = [[NSDateComponents alloc] init];
        
        [components setDay:day];
        [components setMonth:month];
        [components setYear:year];
        
        _categories = [[NSMutableArray alloc] init];
        _schedule = [calendar dateFromComponents:components];
    }
    return self;
}

- (instancetype)init
{
    return [self initWithDate:1 Month:1 AndYear:2000];
}

- (BOOL) addCategory:(VBCategory *) category
{
	if(![_categories containsObject:category])
    {
		[_categories addObject:category];
		return YES;
	}
	return NO;
}

- (VBCategory *)getCategoryWithSeatClass:(VBSeatClass) seatClass
{
    for (VBCategory *category in _categories)
    {
        if (seatClass == category.sClass)
        {
            return category;
        }
    }
    return nil;
}

- (NSString *)description
{
	NSMutableString *desc = [[NSMutableString alloc] init];
	[desc appendString:[@"Flight ID :" stringByAppendingString:_flightId]];
	[desc appendString:[@"\nAvailable categories: " stringByAppendingString:[_categories description]]];
	[desc appendString:[@"\nFrom: " stringByAppendingString:_from]];
	[desc appendString:[@"\nTo: " stringByAppendingString:_to]];
	[desc appendString:[@"\nSchedule: " stringByAppendingString:[_schedule description]]];
	return desc;
}

@end