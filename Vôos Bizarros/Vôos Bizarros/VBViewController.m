//
//  VBViewController.m
//  Vôos Bizarros
//
//  Created by Txai Wieser on 11/12/13.
//  Copyright (c) 2013 com.TDW.app. All rights reserved.
//

#import "VBViewController.h"
#import "VBSystemManager.h"
#import "VBSeatClass.h"
@interface VBViewController ()
{
    VBSystemManager *SystemManager;
}

@end

@implementation VBViewController

- (IBAction)ButtonCreateAirport:(UIButton *)sender
{
    if (_labelAirport.text != nil)
    {
        [SystemManager createAirportWithName:_labelAirport.text];
        _labelTeste.text = _labelAirport.text;
    }
    else
    {
        _labelTeste.text = @"Nome do Aeroporto náo informado.";
    }
}

- (void)viewDidLoad
{

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
