//
//  VBSeat.h
//  Vôos Bizarros
//
//  Created by Stephan Chang on 12/11/13.
//  Copyright (c) 2013 com.TDW.app. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VBSeat : NSObject

@property char row;
@property int column;
@property (getter = isReserved) BOOL reserved;

- (instancetype) initWithRow: (char) aRow
                   AndColumn: (int) aColumn;

@end
