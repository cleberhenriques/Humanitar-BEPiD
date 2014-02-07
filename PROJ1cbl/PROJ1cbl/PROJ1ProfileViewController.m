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

@property (weak, nonatomic) IBOutlet UITableView *instutuicoesMaisVisitadasProfile;
@property (weak, nonatomic) IBOutlet UIImageView *imagemDoPerfil;
@property (weak, nonatomic) IBOutlet UILabel *labelNomeDaPessoa;
@property (strong, nonatomic) PROJ1Usuario *usuarioParaMostrar;
@end

@implementation PROJ1ProfileViewController

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
    [self.instutuicoesMaisVisitadasProfile setDelegate:self];
    [self.instutuicoesMaisVisitadasProfile setDataSource:self];
	// Do any additional setup after loading the view.
    
    
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
 -(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.usuarioParaMostrar.instituicoesMaisVisitadas.count;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifier = @"m";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...

    return cell;
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
