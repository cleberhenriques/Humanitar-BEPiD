//
//  PROJ1ExemplosParseViewController.m
//  PROJ1cbl
//
//  Created by Txai Wieser on 2/11/14.
//  Copyright (c) 2014 com.TDW.app. All rights reserved.
//

#import "PROJ1ExemplosParseViewController.h"
#import <Parse/Parse.h>
@interface PROJ1ExemplosParseViewController ()

@end

@implementation PROJ1ExemplosParseViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    
    // salvar
    PFObject *gameScore = [PFObject objectWithClassName:@"Evento"];
    gameScore[@"titulo"] = @"Festa no AP";
    [gameScore saveInBackground];
    
    
    // listar um registro
    PFQuery *query = [PFQuery queryWithClassName:@"Evento"];
    [query getObjectInBackgroundWithId:@"J3RIqZATIs" block:^(PFObject *gameScore, NSError *error) {
        // Do something with the returned PFObject in the gameScore variable.
        //NSLog(@"%@", gameScore[@"titulo"]);
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
            //PFObject *post = resultado[@"titulo"];
            //NSLog(@"%@", post);
        }
    }];
    
    

    
    
}
@end
