//
//  VBCategory.m
//  Vôos Bizarros
//
//  Created by Txai Wieser on 11/12/13.
//  Copyright (c) 2013 com.TDW.app. All rights reserved.
//

#import "VBCategory.h"

@implementation VBCategory

- (instancetype) initWithClass:(VBSeatClass)aClass
                          Rows:(NSInteger)aRows
                    AndColumns:(NSInteger)aCols
{
    if (self = [super init])
    {
        _sClass = aClass;
        _rows = aRows;
        _cols = aCols;
    }
    
    return self;
}

@end

