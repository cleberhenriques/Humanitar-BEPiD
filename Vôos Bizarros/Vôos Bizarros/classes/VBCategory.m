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
        
        NSString *alfabeto = @"ABCDEFGHIJKLMNOPQRSTUVXYZ";
        for (NSInteger row = 1; row <= aRows; row++)
        {
            for (NSInteger col = 0; col < aCols; col++)
            {
                VBSeat *seat = [[VBSeat alloc] initWithRow:row AndColumn:[alfabeto characterAtIndex:col]];
                [_seats addObject:seat];
            }
        }
    }
    return self;
}

- (BOOL) seatReservedOnRow:(NSInteger)row
                 andCol:(char)col
{
    for (VBSeat *seat in _seats)
    {
        if (row == seat.row && col == seat.column)
        {
            return seat.isReserved;
        }
    }
    return FALSE;
}

- (BOOL) reserveSeatOnRow:(NSInteger)row
                  andCol:(char)col
{
    for (VBSeat *seat in _seats)
    {
        if (row == seat.row && col == seat.column)
        {
            if (seat.isReserved == FALSE)
            {
                seat.reserved = TRUE;
                return TRUE;
            }
            // REVIEW: Aplicar redução (remover else). se a condição falhar, a execução irá para o final do método que já retorna um FALSE.
            else
            {
                return FALSE;
                
            }
        }
    }
    return FALSE;
}
@end

