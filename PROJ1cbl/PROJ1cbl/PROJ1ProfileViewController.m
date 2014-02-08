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

@interface PROJ1ProfileViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableViewinstituicoesMaisVisitadasProfile;
@property (weak, nonatomic) IBOutlet UIImageView *imagemDoPerfil;
@property (strong, nonatomic) PROJ1Usuario *usuarioParaMostrar;
@end

@implementation PROJ1ProfileViewController


- (PROJ1Usuario *)usuarioParaMostrar
{
    PROJ1Usuario *aUser = [[PROJ1Usuario alloc] init];
    
    aUser.instituicoesMaisVisitadas = @[@"Lar das criancas", @"Casa do Vovo", @"Salve Animais", @"blablabla"];
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
    
    [self setTitle:@"Nome da Pessoa"];
    
    NSLog(@"TESTE OK");
    
    // salvar
    PFObject *gameScore = [PFObject objectWithClassName:@"Evento"];
    gameScore[@"titulo"] = @"Festa no AP";
    [gameScore saveInBackground];
    
    
    // listar um registro
    PFQuery *query = [PFQuery queryWithClassName:@"Evento"];
    [query getObjectInBackgroundWithId:@"J3RIqZATIs" block:^(PFObject *gameScore, NSError *error) {
        // Do something with the returned PFObject in the gameScore variable.
        NSLog(@"%@", gameScore[@"titulo"]);
    }];
    
    
    // Editar
    PFQuery *editar = [PFQuery queryWithClassName:@"Evento"];
    
    // Retrieve the object by id
    [editar getObjectInBackgroundWithId:@"MA52ndkeWH" block:^(PFObject *retorno, NSError *error) {
        
        retorno[@"titulo"] = @"Não festa no AP";
        [retorno saveInBackground];
        
    }];
    
    
    // deletar
    PFQuery *deletar = [PFQuery queryWithClassName:@"Evento"];
    [deletar getObjectInBackgroundWithId:@"OUqbxoelsI" block:^(PFObject *retorno, NSError *error) {
        
        [retorno deleteInBackground];
        [retorno saveInBackground];
        
    }];
    
    
    // listar vários dados
    PFQuery *listar = [PFQuery queryWithClassName:@"Evento"];
    
    // Retrieve the most recent ones
    [listar orderByDescending:@"createdAt"];
    
    // Only retrieve the last ten
    listar.limit = 10;
    
    // Include the post data with each comment
    [listar includeKey:@"post"];
    
    [listar findObjectsInBackgroundWithBlock:^(NSArray *result, NSError *error) {
        // Comments now contains the last ten comments, and the "post" field
        // has been populated. For example:
        for (PFObject *resultado in result) {
            // This does not require a network access.
            PFObject *post = resultado[@"titulo"];
            NSLog(@"%@", post);
        }
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
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
