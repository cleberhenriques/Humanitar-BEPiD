//
//  PROJ1EntidadeViewController.m
//  PROJ1cbl
//
//  Created by Txai Wieser on 2/11/14.
//  Copyright (c) 2014 com.TDW.app. All rights reserved.
//

#import "PROJ1EntidadeViewController.h"

@interface PROJ1EntidadeViewController ()

@end

@implementation PROJ1EntidadeViewController


- (PROJ1Entidade *)entidadeParaMostrar
{
    if (!_entidadeParaMostrar) {
        _entidadeParaMostrar = [[PROJ1Entidade alloc] init];
    }
    return _entidadeParaMostrar;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    NSLog(@"ai ai");
    [self.navigationController.navigationBar setBarTintColor: [UIColor colorWithRed:41/255. green:128/255. blue:185/255. alpha:1.0]];
    
    [self setTitle:self.entidadeParaMostrar.nomeEntidade];
    
    
}
@end
