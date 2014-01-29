//
//  CHMyLoginViewController.m
//  ComunitarLogin
//
//  Created by Cleber Henriques on 29/01/14.
//  Copyright (c) 2014 Cleber Henriques. All rights reserved.
//

#import "CHMyLoginViewController.h"

@interface CHMyLoginViewController ()

@end

@implementation CHMyLoginViewController{
    UIImageView *fieldsBackground;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.logInView setLogo:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"logo.png"]]];
    [self.logInView.usernameField setPlaceholder:@"Usuário"];
    [self.logInView.passwordField setPlaceholder:@"Senha"];
    [self.logInView.logInButton setTitle:@"Entrar" forState:UIControlStateNormal];
    [self.logInView.externalLogInLabel setText:@"Você também pode logar com:"];
    [self.logInView.signUpLabel setText:@"Desejo criar uma conta!"];
    [self.logInView.signUpButton setTitle:@"Criar uma conta" forState:UIControlStateNormal];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
