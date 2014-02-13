//
//  PROJ1EntidadeViewController.m
//  PROJ1cbl
//
//  Created by Txai Wieser on 2/11/14.
//  Copyright (c) 2014 com.TDW.app. All rights reserved.
//

#import "PROJ1EntidadeViewController.h"
#import "TDW_HideBarsOnScroll.h"
#import "PROJ1InstitutionTableViewController.h"

@interface PROJ1EntidadeViewController ()
@property (weak, nonatomic) IBOutlet UILabel *qtdVisitados;
@property (weak, nonatomic) IBOutlet UILabel *descricao;
@property (weak, nonatomic) IBOutlet UILabel *interessesRelacionados;

@end

@implementation PROJ1EntidadeViewController


//- (PROJ1Entidade *)entidadeParaMostrar
//{
//    if (!_entidadeParaMostrar) {
//        _entidadeParaMostrar = [[PROJ1Entidade alloc] init];
//        _entidadeParaMostrar.nomeEntidade = @"NAO DEU";
//    }
//    return _entidadeParaMostrar;
//}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self.navigationController.navigationBar setBarTintColor: [UIColor colorWithRed:41/255. green:128/255. blue:185/255. alpha:1.0]];
    
    [self setTitle:self.entidadeParaMostrar.nomeEntidade];
    self.descricao.text = self.entidadeParaMostrar.descricaoEntidade;
    self.qtdVisitados.text = [NSString stringWithFormat:@"%d Visitaram a Instituição", self.entidadeParaMostrar.qtdDeCheckIns];
    if (self.entidadeParaMostrar.interesses) {
        self.interessesRelacionados.text = [@"Interesses Relacionados: " stringByAppendingString:self.entidadeParaMostrar.interesses];
    }else{
        self.interessesRelacionados.text = @"Interesses Relacionados: -";
    }
    
    
    NSLog(@"%@", self.imagemParaMostrar);
    
}

-(void)viewDidAppear:(BOOL)animated
{
    PROJ1InstitutionTableViewController *lastVC = [self.navigationController.viewControllers objectAtIndex:self.navigationController.viewControllers.count-2];
    [lastVC returnToInitialPosition];
}
@end
