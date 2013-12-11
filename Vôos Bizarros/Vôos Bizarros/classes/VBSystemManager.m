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

-(instancetype)init
{
    if (self = [super init])
    {
        airports = [[NSMutableArray alloc]init];
        airlines = [[NSMutableArray alloc]init];
    }
    return self;
}

-(void)createAirport:(NSString *)airportName
{
    VBAirport *airport = [[VBAirport alloc]initWithNome:airportName];
    [airports addObject:airport];
}

-(void)bookSeat:(NSString *)air flight:(NSString *)fl seatClass:(VBSeatClass)s row:(int)row col:(char)col
{
    
}

@end
