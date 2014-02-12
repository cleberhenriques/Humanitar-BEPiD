//
//  PROJ1ProfileViewController.m
//  PROJ1cbl
//
//  Created by Txai Wieser on 03/02/14.
//  Copyright (c) 2014 com.TDW.app. All rights reserved.
//

#import "PROJ1ProfileViewController.h"
#import "PROJ1Usuario.h"
#import <Parse/Parse.h>
#import "PROJ1UserInfoSingleton.h"

@interface PROJ1ProfileViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableViewinstituicoesMaisVisitadasProfile;
@property (weak, nonatomic) IBOutlet UIImageView *imagemDoPerfil;
@property (strong, nonatomic) PROJ1Usuario *usuarioParaMostrar;
@end

@implementation PROJ1ProfileViewController


- (PROJ1Usuario *)usuarioParaMostrar
{
    PROJ1Usuario *aUser = [[PROJ1Usuario alloc] init];
    
    aUser.instituicoesMaisVisitadas = @[@"Lar das criancas", @"Casa do Vovo", @"Salve Animais", @"blablabla", @"strings"];
    return aUser;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.tableViewinstituicoesMaisVisitadasProfile setDelegate:self];
    [self.tableViewinstituicoesMaisVisitadasProfile setDataSource:self];
	// Do any additional setup after loading the view.
    
    [self.navigationController.navigationBar setBarTintColor: [UIColor colorWithRed:41/255. green:128/255. blue:185/255. alpha:1.0]];
    [self.tableViewinstituicoesMaisVisitadasProfile setBounces:NO];
    
    [self setTitle:[[PROJ1UserInfoSingleton sharedManager] nome]];

    [[self imagemDoPerfil] setImage:[[PROJ1UserInfoSingleton sharedManager] foto]];
    //NSLog(@"TESTE OK");
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.usuarioParaMostrar.instituicoesMaisVisitadas.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return self.tableViewinstituicoesMaisVisitadasProfile.bounds.size.height/self.usuarioParaMostrar.instituicoesMaisVisitadas.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifier = @"CellOfMostVisitedInstitutions";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...

    [cell.textLabel setText:self.usuarioParaMostrar.instituicoesMaisVisitadas[indexPath.row]];
    
    return cell;
    
}

@end
