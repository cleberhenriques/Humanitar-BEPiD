//
//  VBAirport.h
//  Vôos Bizarros
//
//  Created by Caetano Porto da Silva on 11/12/13.
//  Copyright (c) 2013 com.TDW.app. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VBAirport : NSObject

@property (readwrite, getter=getName) NSString *name;

- (instancetype) initWithName:(NSString *) name;

@end
