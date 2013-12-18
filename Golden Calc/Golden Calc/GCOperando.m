//
//  GCOperando.m
//  Golden Calc
//
//  Created by Txai Durigon Wieser on 17/12/13.
//  Copyright (c) 2013 Cangootech. All rights reserved.
//

#import "GCOperando.h"

@implementation GCOperando
{
    _Bool virgula;
}

-(void)addDigitToNum:(int) digito
{
    if (virgula) {
        int a=1;
        NSLog(@"entrou");
        NSLog(@"%f - %d",_valor, (int)_valor);
        
        for (int i=1; (_valor-(int)_valor) != 0; i++) {
            _valor = _valor*10;
            a = i;
            NSLog(@"passou");
        }
        _valor = _valor*10 + digito;
        
        _valor = _valor/(pow(10, a));
        NSLog(@"%d", a);
    } else {
        _valor = _valor*10 + digito;
    }
}

-(void)virgulaClick
{
    virgula = 1;
}

-(void)limpaOperando
{
    virgula = 0;
    _valor = 0;
}
@end
