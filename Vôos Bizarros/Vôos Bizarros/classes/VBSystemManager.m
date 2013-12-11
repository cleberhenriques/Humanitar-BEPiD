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

-(BOOL)createAirline:(NSString*) name
{
    if([name length] <= 5)
    {
        VBAirline* airline = [[VBAirline alloc] init];
        for(VBAirline* al in airlines)
        {
           if([airline.nome isEqual:name])
               return NO;
        }
        
        airline.nome = name;
        [airlines addObject:airline];
        return YES;
    }
    
    return NO;
}

@end
