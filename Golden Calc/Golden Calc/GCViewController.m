//
//  GCViewController.m
//  Golden Calc
//
//  Created by fabioschneider on 17/12/13.
//  Copyright (c) 2013 Cangootech. All rights reserved.
//

#import "GCViewController.h"

@interface GCViewController ()
@property (weak, nonatomic) IBOutlet UIButton *btn1;
@property (weak, nonatomic) IBOutlet UIButton *btn2;
@property (weak, nonatomic) IBOutlet UIButton *btn3;
@property (weak, nonatomic) IBOutlet UIButton *btn4;
@property (weak, nonatomic) IBOutlet UIButton *btn5;
@property (weak, nonatomic) IBOutlet UIButton *btn6;
@property (weak, nonatomic) IBOutlet UIButton *btn7;
@property (weak, nonatomic) IBOutlet UIButton *btn8;
@property (weak, nonatomic) IBOutlet UIButton *btn9;
@property (weak, nonatomic) IBOutlet UIButton *btn0;
@property (weak, nonatomic) IBOutlet UIButton *btnequals;
@property (weak, nonatomic) IBOutlet UIButton *btndivide;
@property (weak, nonatomic) IBOutlet UIButton *btntimes;
@property (weak, nonatomic) IBOutlet UIButton *btnminus;
@property (weak, nonatomic) IBOutlet UIButton *btnplus;
@property (weak, nonatomic) IBOutlet UIButton *btndot;


@end

@implementation GCViewController

- (IBAction)clickbtn1:(UIButton *)sender {
}
- (IBAction)clickbtn2:(UIButton *)sender {
}
- (IBAction)clickbtn3:(UIButton *)sender {
}
- (IBAction)clickbtn4:(UIButton *)sender {
}
- (IBAction)clickbtn5:(UIButton *)sender {
}
- (IBAction)clickbtn6:(UIButton *)sender {
}
- (IBAction)clickbtn7:(UIButton *)sender {
}
- (IBAction)clickbtn8:(UIButton *)sender {
}
- (IBAction)clickbtn9:(UIButton *)sender {
}
- (IBAction)clickbtn0:(UIButton *)sender {
}

- (IBAction)clickbtndot:(UIButton *)sender {
}

- (IBAction)clickbtnequals:(UIButton *)sender {
}
- (IBAction)clickbtndivide:(UIButton *)sender {
}
- (IBAction)clickbtntimes:(UIButton *)sender {
}
- (IBAction)clickbtnminus:(UIButton *)sender {
}
- (IBAction)clickbtnplus:(UIButton *)sender {
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIImage *buttonBackgroudImage1 =[UIImage imageNamed:@"number1.png"];
    [_btn1 setBackgroundImage:buttonBackgroudImage1 forState:UIControlStateNormal];
    
    UIImage *buttonBackgroudImage2 =[UIImage imageNamed:@"number2.png"];
    [_btn2 setBackgroundImage:buttonBackgroudImage2 forState:UIControlStateNormal];
    
    UIImage *buttonBackgroudImage3 =[UIImage imageNamed:@"number3.png"];
    [_btn3 setBackgroundImage:buttonBackgroudImage3 forState:UIControlStateNormal];
    
    UIImage *buttonBackgroudImage4 =[UIImage imageNamed:@"number4.png"];
    [_btn4 setBackgroundImage:buttonBackgroudImage4 forState:UIControlStateNormal];
    
    UIImage *buttonBackgroudImage5 =[UIImage imageNamed:@"number5.png"];
    [_btn5 setBackgroundImage:buttonBackgroudImage5 forState:UIControlStateNormal];
    
    UIImage *buttonBackgroudImage6 =[UIImage imageNamed:@"number6.png"];
    [_btn6 setBackgroundImage:buttonBackgroudImage6 forState:UIControlStateNormal];
    
    UIImage *buttonBackgroudImage7 =[UIImage imageNamed:@"number7.png"];
    [_btn7 setBackgroundImage:buttonBackgroudImage7 forState:UIControlStateNormal];
    
    UIImage *buttonBackgroudImage8 =[UIImage imageNamed:@"number8.png"];
    [_btn8 setBackgroundImage:buttonBackgroudImage8 forState:UIControlStateNormal];
    
    UIImage *buttonBackgroudImage9 =[UIImage imageNamed:@"number9.png"];
    [_btn9 setBackgroundImage:buttonBackgroudImage9 forState:UIControlStateNormal];
    
    UIImage *buttonBackgroudImage0 =[UIImage imageNamed:@"number0.png"];
    [_btn0 setBackgroundImage:buttonBackgroudImage0 forState:UIControlStateNormal];
    
    
    //    UIImage *stretchedBackground = [[UIImage alloc]init];
    //     [buttonBackgroudImage scretchableImageWithLeftCapWidth:33 topCapHeight:0]; <<<REDIMENSIONAMENTO
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
