//
//  PROJ1ProfileViewController.m
//  PROJ1cbl
//
//  Created by Txai Wieser on 03/02/14.
//  Copyright (c) 2014 com.TDW.app. All rights reserved.
//

#import "PROJ1ProfileViewController.h"
#import "PROJ1Usuario.h"

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
