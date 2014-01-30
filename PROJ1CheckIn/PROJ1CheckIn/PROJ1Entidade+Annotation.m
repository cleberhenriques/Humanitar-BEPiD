//
//  PROJ1Entidade+Annotation.m
//  PROJ1cbl
//
//  Created by Txai Wieser on 29/01/14.
//  Copyright (c) 2014 com.TDW.app. All rights reserved.
//

#import "PROJ1Entidade+Annotation.h"

@implementation PROJ1Entidade (Annotation)

- (CLLocationCoordinate2D)coordinate
{
    CLLocationCoordinate2D coordinate;
    
    coordinate.latitude = [self.latitude doubleValue];
    coordinate.latitude = [self.longitude doubleValue];
    
    return coordinate;
}


@end
