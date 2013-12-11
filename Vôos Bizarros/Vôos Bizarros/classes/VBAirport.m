//
//  VBAirport.m
//  Vôos Bizarros
//
//  Created by Caetano Porto da Silva on 11/12/13.
//  Copyright (c) 2013 com.TDW.app. All rights reserved.
//

#import "VBAirport.h"

@implementation VBAirport

- (instancetype) initWithName:(NSString *)name
{
    if([name length] <= 3)
    {
        self = [super init];
            
        if (self) {
            self.name = name;
        }
            
        return self;
    }
    else
        return nil;
}

@end
