//
//  VBFlight.m
//  Vôos Bizarros
//
//  Created by Leonardo Gubert on 11/12/13.
//  Copyright (c) 2013 com.TDW.app. All rights reserved.
//

#import "VBFlight.h"

@implementation VBFlight

- (instancetype)init
{
    if (self = [super init])
    {
        _categories = [[NSMutableArray alloc] init];
    }
    return self;
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

- (VBCategory *)getCategoryWhithSeatClass:(VBSeatClass)seatClass
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

@end