//
//  PROJ1UserInfoSingleton.m
//  PROJ1cbl
//
//  Created by Cleber Henriques on 05/02/14.
//  Copyright (c) 2014 com.TDW.app. All rights reserved.
//

#import "PROJ1UserInfoSingleton.h"

@implementation PROJ1UserInfoSingleton

+ (id)sharedManager {
    static PROJ1UserInfoSingleton *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
    }) ;
    return sharedMyManager;
}

- (id)init{
    NSLog(@"setting nome");
    if (self = [super init]) {
        self.nome = @"Default Property Value";
    }
    return self;
}

@end
