//
//  VBSeat.h
//  Vôos Bizarros
//
//  Created by Stephan Chang on 12/11/13.
//  Copyright (c) 2013 com.TDW.app. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VBSeat : NSObject

@property int row;
@property char column;
@property (getter = isReserved) BOOL reserved;

- (instancetype) initWithRow:(int) aRow
                   AndColumn:(char) aColumn;

@end
