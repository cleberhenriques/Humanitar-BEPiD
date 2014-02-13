//
//  PROJ1EntidadeViewController.h
//  PROJ1cbl
//
//  Created by Txai Wieser on 2/11/14.
//  Copyright (c) 2014 com.TDW.app. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PROJ1Entidade.h"

@interface PROJ1EntidadeViewController : UIViewController

@property (strong, nonatomic) PROJ1Entidade *entidadeParaMostrar;
@property (strong, nonatomic) IBOutlet UIImageView *imagemParaMostrar;

@end
