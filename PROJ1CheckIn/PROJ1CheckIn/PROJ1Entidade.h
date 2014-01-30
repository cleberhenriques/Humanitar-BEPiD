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
@property (nonatomic) NSString *descricaoEntidade;
@property (nonatomic, strong) NSNumber *latitude; // double
@property (nonatomic, strong) NSNumber *longitude; // double
@property (nonatomic) NSNumber *codTipoEntidade; // int

@end
