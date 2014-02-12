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
@property (weak, nonatomic) IBOutlet UILabel *lbInteresses;
@end

@implementation PROJ1ProfileViewController


- (PROJ1Usuario *)usuarioParaMostrar
{
    if (!_usuarioParaMostrar) {
        _usuarioParaMostrar = [[PROJ1Usuario alloc] init];
    }
    return _usuarioParaMostrar;
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
    
    _lbInteresses.text = [@"Preferencias: " stringByAppendingString:[[[PFUser currentUser] objectForKey:@"entidadePref"] componentsJoinedByString:@", "]];
    
    
    
    
    PROJ1Usuario *aUser = [[PROJ1Usuario alloc] init];
    
    // retorna as instituições do Parse
    PFQuery *listar = [PFQuery queryWithClassName:@"Instituicoes"];
    [listar orderByDescending:@"name"];
    listar.limit = 100;
    
    __block NSMutableArray *arrayTemporarioBlock = [[NSMutableArray alloc] init];
    [listar findObjectsInBackgroundWithBlock:^(NSArray *result, NSError *error) {
        
        for (PFObject *resultado in result) {
            PFObject *post = resultado[@"name"];
            //NSLog(@"----%@", post);
            [arrayTemporarioBlock addObject:[NSString stringWithFormat:@"%@", post]];
        }
        
        NSLog(@"%@", arrayTemporarioBlock);
        self.usuarioParaMostrar.instituicoesMaisVisitadas = arrayTemporarioBlock;
        NSLog(@"XX %@", self.usuarioParaMostrar.instituicoesMaisVisitadas);
        [self.tableViewinstituicoesMaisVisitadasProfile reloadData];
    }];

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
