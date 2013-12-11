//
//  VBSystemManager.m
//  Vôos Bizarros
//
//  Created by Felipe Delazeri Riffel on 11/12/13.
//  Copyright (c) 2013 com.TDW.app. All rights reserved.
//

#import "VBSystemManager.h"

@implementation VBSystemManager
{
    NSMutableArray *airports;
    NSMutableArray *airlines;
}

-(void)createFlight:(NSString *)name :(NSString *)origem :(NSString *)destino :(int)year :(int)month :(int)day :(NSString *)flightID{
	
	VBAirline *air = [self findCompany:name];
	if(air == nil){
		NSLog(@"Companhia nao existente.");
	}
	
	VBFlight *voo = [[VBFlight alloc] init];
	voo.orig = origem;
	voo.dest = destino;
	voo.year = year;
	voo.month = month;
	voo.day = day;
	voo.flID = flightID;
	
	[air addFlight: voo];
}

-(VBAirline*)findCompany:(NSString*)name{
	for (VBAirline* comp in airlines) {
		if([name compare: comp.nome]){
			return comp;
		}
	}
	return nil;
}


@end
