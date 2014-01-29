//
//  PROJ1Eventos.h
//  PROJ1
//
//  Created by fabioschneider on 28/01/14.
//  Copyright (c) 2014 Cangootech. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PROJ1Evento : NSObject

@property (nonatomic) NSNumber *codEvento; // int
@property (nonatomic) NSNumber *codEntidade; // int
@property (nonatomic) NSString *nomeEvento;
@property (nonatomic) NSString *descricaoEvento;
@property (nonatomic) NSData   *dataEvento;
@property (nonatomic) NSArray  *albumFotosEvento;  // array of UIImages

@end
