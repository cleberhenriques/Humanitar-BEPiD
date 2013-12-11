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
{
	NSMutableArray *categories;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        categories = [[NSMutableArray alloc]init];
    }
    return self;
}

-(NSString*)getCategories{
	return [categories description];
}

-(BOOL)addCategorie:(VBCategory *)categorie{
	if(![categories containsObject:categorie]){
		[categories addObject:categorie];
		return YES;
	}
	return NO;
}

@end