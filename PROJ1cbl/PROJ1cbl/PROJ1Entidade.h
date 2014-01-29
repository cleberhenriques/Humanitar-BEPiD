//
//  PROJ1Entidade.h
//  PROJ1
//
//  Created by fabioschneider on 28/01/14.
//  Copyright (c) 2014 Cangootech. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PROJ1Entidade : NSObject

@property (nonatomic) NSNumber *codEntidade; // int
@property (nonatomic) NSString *nomeEntidade;
@property (nonatomic) NSString *desccricaoEntidade;
@property (nonatomic) NSNumber *latitude; // double
@property (nonatomic) NSNumber *longitude; // double
@property (nonatomic) NSNumber *codTipoEntidade; // int

@end
