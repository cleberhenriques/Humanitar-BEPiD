//
//  PROJ1ViewController.m
//  PROJ1TableView
//
//  Created by Txai Wieser on 20/01/14.
//  Copyright (c) 2014 com.TDW.app. All rights reserved.
//

#import "PROJ1InstitutionTableViewController.h"
#import "PROJ1Evento.h"
#import "PROJ1UserInfoSingleton.h"
@interface PROJ1InstitutionTableViewController()

@property (weak, nonatomic) IBOutlet UITableView *timeLineTableView;
@property (nonatomic) CGPoint lastOffset;
@property (strong, nonatomic) NSArray *arrayOfEvents; // contem objetos do tipo EVENTO para serem mostrados na timeline.
@property (nonatomic) int selectedTimeLineFilter;
@property (weak, nonatomic) IBOutlet PFImageView *myImage;
@property (strong, nonatomic) NSString *className;
@property (nonatomic) int previousScrollViewYOffset;
@end

@implementation PROJ1InstitutionTableViewController

- (id)initWithStyle:(UITableViewStyle)style {
    self = [super initWithStyle:style];
    if (self) {
        // This table displays items in the Todo class
        self.className = @"Evento";
        self.pullToRefreshEnabled = YES;
        self.paginationEnabled = NO;
        self.objectsPerPage = 25;
    }
    
    return self;
}

- (PFQuery *)queryForTable {
    PROJ1UserInfoSingleton *userInfo = [PROJ1UserInfoSingleton sharedManager];
    NSLog(@"nome %@",[userInfo nome]);
    PFQuery *query = [PFQuery queryWithClassName:@"Evento" ];
    [query whereKey:@"type" equalTo:[NSString stringWithFormat:@"%d", self.selectedTimeLineFilter]];
    // If no objects are loaded in memory, we look to the cache
    // first to fill the table and then subsequently do a query
    // against the network.
    if ([self.objects count] == 0) {
        query.cachePolicy = kPFCachePolicyCacheThenNetwork;
    }
    
    [query orderByDescending:@"createdAt"];
    
    return query;
}

- (NSArray *)arrayOfEvents
{
    if (!_arrayOfEvents) {
        
        _arrayOfEvents = [[NSArray alloc] initWithArray:[self buscaArrayDeEventos]];
    }
    NSLog(@"%@", _arrayOfEvents);
    return _arrayOfEvents;
}

- (NSArray *)buscaArrayDeEventos
{
    
    NSMutableArray *arrayDeEventosTemporario = [[NSMutableArray alloc] init];
    
    ///////////////
    if (self.selectedTimeLineFilter == 0) {
        
        // ENTRE OS // RETIRAR O CODIGO EXEMPLO E RETORNAR UM ARRAY arraydeEventosTemporario com os eventos da classe Evento
        // Aqui é os RECENTES
        ///////////////////////////////////////
        for (int i=0; i<12; i++) {
            PROJ1Evento *umEventoTemporario = [[PROJ1Evento alloc] init];
            
            umEventoTemporario.nomeEvento = [NSString stringWithFormat:@"Post %d",i+1];
            umEventoTemporario.descricaoEvento = [NSString stringWithFormat:@"Descricao do evento de numero %d",i+1];
            NSLog(@"%d",i);
            NSArray *myArray = [NSArray arrayWithObjects:@"The Road.jpg", @"Arvore.jpg", @"Praia.jpg", @"Aguas.jpg", @"Onda.jpg", @"Breaking Bad.jpg", @"Cachoeira.jpg", @"Caminho.jpg", @"Cosmos.jpg", @"Leopard Screen.jpg", @"Milky Way.jpg", @"iPhone Generations.jpg", nil];
            
            umEventoTemporario.albumFotosEvento = [NSArray arrayWithObject:[UIImage imageNamed:myArray[i]]];
            
            [arrayDeEventosTemporario addObject:umEventoTemporario];
            
        }
        ///////////////////////////////////////
    }
    else if (self.selectedTimeLineFilter == 1) {
        // ENTRE OS // RETIRAR O CODIGO EXEMPLO E RETORNAR UM ARRAY arraydeEventosTemporario com os eventos da classe Evento
        // Aqui é os PROXIMOS
        ///////////////////////////////////////
        for (int i=0; i<4; i++) {
            PROJ1Evento *umEventoTemporario = [[PROJ1Evento alloc] init];
            
            umEventoTemporario.nomeEvento = [NSString stringWithFormat:@"Post %d",i+1];
            umEventoTemporario.descricaoEvento = [NSString stringWithFormat:@"Descricao do evento de numero %d",i+1];
            NSLog(@"%d",i);
            NSArray *myArray = [NSArray arrayWithObjects:@"Onda.jpg", @"Breaking Bad.jpg", @"Cachoeira.jpg", @"Caminho.jpg", @"Cosmos.jpg", nil];
            
            umEventoTemporario.albumFotosEvento = [NSArray arrayWithObject:[UIImage imageNamed:myArray[i]]];
            
            [arrayDeEventosTemporario addObject:umEventoTemporario];
            
        }
        ///////////////////////////////////////
    }
    else if (self.selectedTimeLineFilter == 2) {
        // ENTRE OS // RETIRAR O CODIGO EXEMPLO E RETORNAR UM ARRAY arraydeEventosTemporario com os eventos da classe Evento
        // Aqui é os PERTOS
        ///////////////////////////////////////
        for (int i=0; i<2; i++) {
            PROJ1Evento *umEventoTemporario = [[PROJ1Evento alloc] init];
            
            umEventoTemporario.nomeEvento = [NSString stringWithFormat:@"Post %d",i+1];
            umEventoTemporario.descricaoEvento = [NSString stringWithFormat:@"Descricao do evento de numero %d",i+1];
            NSLog(@"%d",i);
            NSArray *myArray = [NSArray arrayWithObjects:@"Milky Way.jpg", @"The Road.jpg", @"iPhone Generations.jpg", nil];
            
            umEventoTemporario.albumFotosEvento = [NSArray arrayWithObject:[UIImage imageNamed:myArray[i]]];
            
            [arrayDeEventosTemporario addObject:umEventoTemporario];
            
        }
        ///////////////////////////////////////
        
    }
    
    
    return arrayDeEventosTemporario;

}

//-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
//{
    
//    return self.arrayOfEvents.count;
//}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath object:(PFObject *)object {
    static NSString *CellIdentifier = @"TimeLineCell";
    PFTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    if (!cell) {
        cell = [[PFTableViewCell alloc]
                initWithStyle:UITableViewCellStyleDefault
                reuseIdentifier:CellIdentifier];
    }
    // Configure the cell...
    // ADICIONA TITULO NA CELULA
    UILabel *titleCellLabel = (UILabel *)[cell viewWithTag:100];
    [titleCellLabel setTextAlignment:NSTextAlignmentCenter];
    titleCellLabel.text = [object objectForKey:@"titulo"];
    //titleCellLabel.textColor = [UIColor colorWithRed:46/255. green:204/255. blue:113/255. alpha:1.0];
    titleCellLabel.font = [UIFont fontWithName:@"HelveticaNeue-UltraLight" size:30];
    
    //ADICIONA IMAGEM NA CELULA
    
    PFImageView *cellImageView = (PFImageView *)[cell viewWithTag:101];
    
    PFFile *thumbnail = [object objectForKey:@"imagem"];
    if (thumbnail && ![thumbnail isEqual:[NSNull null]]) {
        cellImageView.image = [UIImage imageNamed:@"placeholder.jpg"];
        cellImageView.file = thumbnail;
        [cellImageView loadInBackground:^(UIImage *image, NSError *error) {
            if(!error){
                // se tiver que editar a imagem, edita aqui dentro desse if.
                CGSize newSize = CGSizeMake(cellImageView.frame.size.width, cellImageView.frame.size.height);
                UIGraphicsBeginImageContext( newSize );
                [image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)]; //newSize.width, newSize.height)];
                UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
                UIGraphicsEndImageContext();
                
                // cropping the image
                
                CGRect clippedRect  = CGRectMake(0, 0, cellImageView.frame.size.width, cellImageView.frame.size.width);
                CGImageRef imageRef = CGImageCreateWithImageInRect([newImage CGImage], clippedRect);
                image = [UIImage imageWithCGImage:imageRef];
                
                CGImageRelease(imageRef);
                
                cellImageView.layer.cornerRadius = cellImageView.frame.size.width/12; //image.size.width/2;
                cellImageView.layer.masksToBounds = YES;
                
            }
        }];
    }
    
    // making the image rounded
    

#define BOTTOMIMAGESIZE 40
    UIButton *likeButtonsCell = (UIButton *)[cell viewWithTag:110];
    
    [likeButtonsCell.titleLabel setTextAlignment:NSTextAlignmentLeft];
    [likeButtonsCell setTitle:@"Curtir" forState:UIControlStateNormal];
    //[likeButtonsCell setBackgroundColor:[UIColor greenColor]];
    
    UIButton *commentButtonsCell = (UIButton *)[cell viewWithTag:111];
    
    [commentButtonsCell.titleLabel setTextAlignment:NSTextAlignmentRight];
    [commentButtonsCell setTitle:@"Comentários" forState:UIControlStateNormal];
    //[commentButtonsCell setBackgroundColor:[UIColor greenColor]];
    

    UILabel *descricaoEventoLabel = (UILabel *)[cell viewWithTag:1000];
    descricaoEventoLabel.text = [object objectForKey:@"descricao"];
    
    
    return cell;
    
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.timeLineTableView.allowsSelection = NO;
    
    [self.navigationController.navigationBar setBarTintColor: [UIColor colorWithRed:41/255. green:128/255. blue:185/255. alpha:1.0]];
    [self.tabBarController.tabBar setBarTintColor: [UIColor colorWithRed:52/255. green:152/255. blue:219/255. alpha:1.0]];
    
    [self.navigationController.navigationBar setTranslucent:NO];
    [self.tabBarController.tabBar setTranslucent:NO];
    
    
    UIView *headerViewSelectionButtons = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.timeLineTableView.frame.size.width, 46)];
    
    //headerViewSelectionButtons.backgroundColor = [UIColor greenColor];
#define MARGINHEADERSEGMENT 6
    
    UISegmentedControl *segmentButtons = [[UISegmentedControl alloc] initWithItems:[NSArray arrayWithObjects:@"Recentes", @"Próximo", @"Perto" ,nil]];
    segmentButtons.frame = CGRectMake(MARGINHEADERSEGMENT, MARGINHEADERSEGMENT, headerViewSelectionButtons.frame.size.width-(2*MARGINHEADERSEGMENT), headerViewSelectionButtons.frame.size.height-(2*MARGINHEADERSEGMENT));
    
    [segmentButtons addTarget:self action:@selector(didJustChangeOptionOnSegmentedControl:) forControlEvents:UIControlEventValueChanged];
    [segmentButtons setSelectedSegmentIndex:0];
    
    [headerViewSelectionButtons addSubview:segmentButtons];
    
    
    self.timeLineTableView.tableHeaderView = headerViewSelectionButtons;

    
    
    
    
    [PFFacebookUtils initializeFacebook];
    
    if (![PFUser currentUser]) {
        // Customize the Log In View Controller
        PFLogInViewController *logInViewController = [[PFLogInViewController alloc] init];
        [logInViewController setDelegate:self];
        [logInViewController setFacebookPermissions:[NSArray arrayWithObjects:@"friends_about_me", nil]];
        [logInViewController setFields: PFLogInFieldsFacebook];
        
        // Present Log In View Controller
        [self presentViewController:logInViewController animated:NO completion:NULL];
    }

    
    
}

- (void)didJustChangeOptionOnSegmentedControl:(UISegmentedControl *)segment
{
    
    self.selectedTimeLineFilter = segment.selectedSegmentIndex;
    self.arrayOfEvents = nil;
    [self loadObjects];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    NSLog(@"MEMORY WARNING");
}



-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [PFFacebookUtils initializeFacebook];
    
    if (![PFUser currentUser]) {
        // Customize the Log In View Controller
        PFLogInViewController *logInViewController = [[PFLogInViewController alloc] init];
        [logInViewController setDelegate:self];
        [logInViewController setFacebookPermissions:[NSArray arrayWithObjects:@"friends_about_me", nil]];
        [logInViewController setFields: PFLogInFieldsFacebook];
        
        // Present Log In View Controller
        [self presentViewController:logInViewController animated:NO completion:NULL];
    }
}




- (void)logInViewController:(PFLogInViewController *)logInController didLogInUser:(PFUser *)user {
    [self dismissViewControllerAnimated:NO completion:NULL];
}

// Sent to the delegate when the log in attempt fails.
- (void)logInViewController:(PFLogInViewController *)logInController didFailToLogInWithError:(NSError *)error {
    NSLog(@"Failed to log in...");
}

// Sent to the delegate when the log in screen is dismissed.
- (void)logInViewControllerDidCancelLogIn:(PFLogInViewController *)logInController {
    [self.navigationController popViewControllerAnimated:YES];
}


// Sent to the delegate to determine whether the log in request should be submitted to the server.
- (BOOL)logInViewController:(PFLogInViewController *)logInController shouldBeginLogInWithUsername:(NSString *)username password:(NSString *)password {
    // Check if both fields are completed
    if (username && password && username.length != 0 && password.length != 0) {
        return YES; // Begin login process
    }
    
    [[[UIAlertView alloc] initWithTitle:@"Missing Information"
                                message:@"Make sure you fill out all of the information!"
                               delegate:nil
                      cancelButtonTitle:@"ok"
                      otherButtonTitles:nil] show];
    return NO; // Interrupt login process
}





@end
