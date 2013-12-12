//
//  VBCategory.h
//  Vôos Bizarros
//
//  Created by Txai Wieser on 11/12/13.
//  Copyright (c) 2013 com.TDW.app. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VBSeatClass.h"
#import "VBSeat.h"

@interface VBCategory : NSObject

@property (nonatomic) NSMutableArray *seats;
@property (nonatomic) VBSeatClass sClass;
@property (nonatomic) NSInteger rows;
@property (nonatomic) NSInteger cols;

- (instancetype) initWithClass:(VBSeatClass) aClass
                          Rows:(NSInteger) aRows
                    AndColumns:(NSInteger) aCols;
- (BOOL)seatReservedOnRow:(NSInteger)row
                 andCol:(char)col;
- (BOOL) reserveSeatOnRow:(NSInteger)row
                   andCol:(char)col;


@end
