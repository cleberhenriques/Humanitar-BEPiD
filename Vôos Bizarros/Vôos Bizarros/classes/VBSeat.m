//
//  VBSeat.m
//  Vôos Bizarros
//
//  Created by Stephan Chang on 12/11/13.
//  Copyright (c) 2013 com.TDW.app. All rights reserved.
//

#import "VBSeat.h"

@implementation VBSeat

- (instancetype) initWithRow: (char) aRow
                   AndColumn: (int) aColumn
{
    if (self = [super init])
    {
        _row = aRow;
        _column = aColumn;
        _reserved = NO;
    }
    
    return self;
}
@end