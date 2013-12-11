//
//  VBFlight.h
//  Vôos Bizarros
//
//  Created by Leonardo Gubert on 11/12/13.
//  Copyright (c) 2013 com.TDW.app. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VBCategory.h"

@interface VBFlight : NSObject

@property NSMutableArray *categories;
@property NSString *flID;

- (BOOL) addCategorie:(VBCategory*) categorie;

@end
