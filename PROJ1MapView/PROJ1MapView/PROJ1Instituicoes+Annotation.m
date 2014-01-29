//
//  PROJ1Instituicoes+Annotation.m
//  PROJ1MapView
//
//  Created by Txai Wieser on 1/28/14.
//  Copyright (c) 2014 Txai Wieser. All rights reserved.
//

#import "PROJ1Instituicoes+Annotation.h"

@implementation PROJ1Instituicoes (Annotation)



- (CLLocationCoordinate2D)coordinate
{
    CLLocationCoordinate2D coordinate;
    
    coordinate.latitude = [self.latitudeDaInstituicao doubleValue];
    coordinate.latitude = [self.longitudeDaInstituicao doubleValue];
 
    return coordinate;
}


@end