//
//  VBFlight.m
//  Vôos Bizarros
//
//  Created by Leonardo Gubert on 11/12/13.
//  Copyright (c) 2013 com.TDW.app. All rights reserved.
//

#import "VBFlight.h"
#import "VBCategory.h"

@implementation VBFlight

- (instancetype)init
{
    self = [super init];
    if (self) {
        _categories = [[NSMutableArray alloc]init];
    }
    return self;
}

- (BOOL) addCategorie: (VBCategory *) categorie
{
	if(![_categories containsObject:categorie]){
		[_categories addObject:categorie];
		return YES;
	}
	return NO;
}
@end