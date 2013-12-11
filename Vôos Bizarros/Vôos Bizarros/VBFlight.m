//
//  VBFlight.m
//  Vôos Bizarros
//
//  Created by Leonardo Gubert on 11/12/13.
//  Copyright (c) 2013 com.TDW.app. All rights reserved.
//

#import "VBFlight.h"

@implementation VBFlight
{
	NSMutableArray *categories;
}

- (id)init
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

//preciso classe category
-(BOOL)addCategorie:(NSString *)categorie{
	if(![categories containsObject:categorie]){
		[categories addObject:categorie];
		return YES;
	}
	return NO;
}




@end