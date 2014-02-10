//
//  PROJ1UserInfoSingleton.h
//  PROJ1cbl
//
//  Created by Cleber Henriques on 05/02/14.
//  Copyright (c) 2014 com.TDW.app. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PROJ1UserInfoSingleton : NSObject

@property (nonatomic) NSString *nome;

+ (id)sharedManager;

@end
