//
//  GCOperando.h
//  Golden Calc
//
//  Created by Txai Durigon Wieser on 17/12/13.
//  Copyright (c) 2013 Cangootech. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GCOperando : NSObject


@property float valor;

-(void)addDigitToNum:(int)digito;
-(void)virgulaClick;
-(void)limpaOperando;
@end
