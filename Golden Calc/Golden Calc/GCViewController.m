//
//  GCViewController.m
//  Golden Calc
//
//  Created by fabioschneider on 17/12/13.
//  Copyright (c) 2013 Cangootech. All rights reserved.
//

#import "GCViewController.h"
#import "GCOperando.h"

@interface GCViewController ()


@property (weak, nonatomic) IBOutlet UILabel *CampoOperando1;
@property (weak, nonatomic) IBOutlet UILabel *CampoOperando2;

@property (weak, nonatomic) IBOutlet UILabel *CampoOperador;
@property (weak, nonatomic) IBOutlet UILabel *CampoResultado;

@property (weak, nonatomic) IBOutlet UILabel *CampoHistorico1;
@property (weak, nonatomic) IBOutlet UILabel *CampoHistorico2;
@property (weak, nonatomic) IBOutlet UILabel *CampoHistorico3;
@property (weak, nonatomic) IBOutlet UILabel *CampoHistorico4;

@end

@implementation GCViewController
{
    GCOperando *op1;
    GCOperando *op2;
    int operador;
    _Bool operando1completo;
    _Bool operacaoJaDefinida;
    float respostaDaOperacao;
    _Bool flagJaDeuResultado;
    NSString *stringOperador;
}

- (IBAction)clickbtn1:(UIButton *)sender
{
    [self botaoNumero:1];
}
- (IBAction)clickbtn2:(UIButton *)sender
{
    [self botaoNumero:2];
}
- (IBAction)clickbtn3:(UIButton *)sender
{
    [self botaoNumero:3];
}
- (IBAction)clickbtn4:(UIButton *)sender
{
    [self botaoNumero:4];
}
- (IBAction)clickbtn5:(UIButton *)sender
{
    [self botaoNumero:5];
}
- (IBAction)clickbtn6:(UIButton *)sender
{
    [self botaoNumero:6];
}
- (IBAction)clickbtn7:(UIButton *)sender
{
    [self botaoNumero:7];
}
- (IBAction)clickbtn8:(UIButton *)sender
{
    [self botaoNumero:8];
}
- (IBAction)clickbtn9:(UIButton *)sender
{
    [self botaoNumero:9];
}
- (IBAction)clickbtn0:(UIButton *)sender
{
    [self botaoNumero:0];
}

// Virgula
- (IBAction)clickbtndot:(UIButton *)sender
{
    if (operando1completo) {
        [op2 virgulaClick];
    } else {
        [op1 virgulaClick];
    }
    respostaDaOperacao = op1.valor / op2.valor;
}


- (IBAction)clickbtnequals:(UIButton *)sender
{
    flagJaDeuResultado = 1;
    switch (operador) {
        case 1:
            respostaDaOperacao = op1.valor / op2.valor;
            break;
        case 2:
            respostaDaOperacao = op1.valor * op2.valor;
            break;
        case 3:
            respostaDaOperacao = op1.valor - op2.valor;
            break;
        case 4:
            respostaDaOperacao = op1.valor + op2.valor;
            break;
        default:
            NSLog(@"erro1");
            break;
    }
    
    [self.CampoResultado setText:[NSString stringWithFormat:@"%.2f",respostaDaOperacao]];

}

//Operações
- (IBAction)clickbtndivide:(UIButton *)sender
{
    //Divide
    [self escolheOperador:@"/"];
    operador = 1;
    
}
- (IBAction)clickbtntimes:(UIButton *)sender
{
    //Multiplica
    [self escolheOperador:@"x"];
    operador = 2;
}
- (IBAction)clickbtnminus:(UIButton *)sender
{
    //Subtrai
    [self escolheOperador:@"-"];
    operador = 3;
}
- (IBAction)clickbtnplus:(UIButton *)sender
{
    //Soma
    [self escolheOperador:@"+"];
    operador = 4;
}

-(void)escolheOperador:(NSString *)sOperador
{
    if (!operacaoJaDefinida) {
        operacaoJaDefinida = 1;
        operando1completo = 1;
        [self.CampoOperador setText:sOperador];
        stringOperador = sOperador;
        
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    op1 = [[GCOperando alloc] init];
    op2 = [[GCOperando alloc] init];
    operando1completo = 0;
    operacaoJaDefinida = 0;
    respostaDaOperacao = 0;
    operador = 0;
    flagJaDeuResultado = 0;

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)ClearCal:(UIButton *)sender {
    
    
    [self.CampoOperando2 setText:@""];
    [self.CampoOperando1 setText:@""];
    [self.CampoOperador setText:@""];
    [self.CampoResultado setText:@""];
    
    op1 = [[GCOperando alloc] init];
    op2 = [[GCOperando alloc] init];
    operando1completo = 0;
    operacaoJaDefinida = 0;
    respostaDaOperacao = 0;
    operador = 0;
    
}

-(void)limpaResultadoEOperandosPNovoCalc
{
    self.CampoHistorico4.text = self.CampoHistorico3.text;
    self.CampoHistorico3.text = self.CampoHistorico2.text;
    self.CampoHistorico2.text = self.CampoHistorico1.text;
    
    [self.CampoHistorico1 setText:[NSString stringWithFormat:@"%.2f %@ %.2f = %.2f",op1.valor, stringOperador, op2.valor, respostaDaOperacao]];
    
    [self.CampoOperando2 setText:@""];
    [self.CampoOperando1 setText:@""];
    [self.CampoOperador setText:@""];
    [self.CampoResultado setText:@""];
    
    
    op1 = [[GCOperando alloc] init];
    op2 = [[GCOperando alloc] init];
    operando1completo = 0;
    operacaoJaDefinida = 0;
    respostaDaOperacao = 0;
    operador = 0;
}

-(void)botaoNumero:(int)numApertado
{
    if (flagJaDeuResultado) {
        [self limpaResultadoEOperandosPNovoCalc];
        flagJaDeuResultado = 0;
    }
    
    if (operando1completo) {
        [op2 addDigitToNum:numApertado];
        NSLog(@"%f", op2.valor);
        [self.CampoOperando2 setText: [NSString stringWithFormat:@"%.2f",op2.valor]];
        
    } else {
        [op1 addDigitToNum:numApertado];
        [self.CampoOperando1 setText: [NSString stringWithFormat:@"%.2f",op1.valor]];
        NSLog(@"%f", op1.valor);
    }
}

@end
