//
//  PROJ1Instituicoes.h
//  PROJ1MapView
//
//  Created by Txai Wieser on 1/28/14.
//  Copyright (c) 2014 Txai Wieser. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PROJ1Instituicoes : NSObject

@property (nonatomic) NSString *nomeDaInstituicao;
@property (nonatomic, strong) NSNumber *latitudeDaInstituicao; // doubleValue
@property (nonatomic, strong) NSNumber *longitudeDaInstituicao; // doubleValue

@end
