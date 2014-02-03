//
//  PROJ1Usuario.h
//  PROJ1
//
//  Created by fabioschneider on 28/01/14.
//  Copyright (c) 2014 Cangootech. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PROJ1Usuario : NSObject

@property (nonatomic) NSNumber *codUsuario; // int
@property (nonatomic) NSString *nomeUsuario;
@property (nonatomic) NSString *loginUsuario;
@property (nonatomic) NSString *senhaUsuario;
@property (nonatomic) NSNumber *tipoUsuario; // int
@property (nonatomic) NSArray *instituicoesMaisVisitadas;
@end
