//
//  PROJ1ViewController.m
//  PROJ1TableView
//
//  Created by Txai Wieser on 20/01/14.
//  Copyright (c) 2014 com.TDW.app. All rights reserved.
//

#import "PROJ1InstitutionTableViewController.h"
#import "PROJ1Evento.h"
#import "PROJ1Entidade.h"
#import "PROJ1EntidadeViewController.h"
#import "PROJ1UserInfoSingleton.h"
#import "PROJ1LoginViewController.h"

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
    //NSLog(@"nome %@",[userInfo nome]);
    PFQuery *query = [PFQuery queryWithClassName:@"Evento" ];
    if(self.selectedTimeLineFilter == 0){
        [query whereKey:@"type" equalTo:[NSString stringWithFormat:@"%d", self.selectedTimeLineFilter]];
#warning SUBSTITUIR O FILTRO 0 e 1 pelos interesses
    }
    // If no objects are loaded in memory, we look to the cache
    // first to fill the table and then subsequently do a query
    // against the network.
    if ([self.objects count] == 0) {
        query.cachePolicy = kPFCachePolicyCacheThenNetwork;
    }
    
    [query orderByDescending:@"createdAt"];
    
    return query;
}


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
    UIButton *titleCellLabel = (UIButton *)[cell viewWithTag:101];
    [titleCellLabel setTitle:[object objectForKey:@"titulo"] forState:UIControlStateNormal];
    //ADICIONA IMAGEM NA CELULA
    
    PFImageView *cellImageView = (PFImageView *)[cell viewWithTag:100];
    
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

    UILabel *descricaoEventoLabel = (UILabel *)[cell viewWithTag:102];
    descricaoEventoLabel.text = [object objectForKey:@"descricao"];
    
    
    return cell;
    
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.timeLineTableView.allowsSelection = YES;
    
    [self.navigationController.navigationBar setBarTintColor: [UIColor colorWithRed:41/255. green:128/255. blue:185/255. alpha:1.0]];
    [self.tabBarController.tabBar setBarTintColor: [UIColor colorWithRed:41/255. green:128/255. blue:185/255. alpha:1.0]];
    
    [self.navigationController.navigationBar setTranslucent:NO];
    [self.tabBarController.tabBar setTranslucent:NO];
    [self.tabBarController.tabBar setTintColor:[UIColor colorWithRed:0 green:45/255. blue:100/255. alpha:1.0]];

#warning LOGOUT FOR LOGIN TESTS
    //[PFUser logOut];
    
    [self setTitle:@"Humanitar"];

       
    UIView *headerViewSelectionButtons = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.timeLineTableView.frame.size.width, 46)];
    
    //headerViewSelectionButtons.backgroundColor = [UIColor greenColor];
#define MARGINHEADERSEGMENT 6
    
    UISegmentedControl *segmentButtons = [[UISegmentedControl alloc] initWithItems:[NSArray arrayWithObjects:@"Interesses", @"Todas",nil]];
    segmentButtons.frame = CGRectMake(MARGINHEADERSEGMENT, MARGINHEADERSEGMENT, headerViewSelectionButtons.frame.size.width-(2*MARGINHEADERSEGMENT), headerViewSelectionButtons.frame.size.height-(2*MARGINHEADERSEGMENT));
    
    [segmentButtons addTarget:self action:@selector(didJustChangeOptionOnSegmentedControl:) forControlEvents:UIControlEventValueChanged];
    [segmentButtons setSelectedSegmentIndex:0];
    
    [headerViewSelectionButtons addSubview:segmentButtons];
    
    
    self.timeLineTableView.tableHeaderView = headerViewSelectionButtons;

    
    
    [self LogInCheckAndPreferences];
}




- (void)didJustChangeOptionOnSegmentedControl:(UISegmentedControl *)segment
{
    
    self.selectedTimeLineFilter = segment.selectedSegmentIndex;
    self.arrayOfEvents = nil;
    [self loadObjects];
}


-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    [self LogInCheckAndPreferences];
}


- (void)LogInCheckAndPreferences
{
    [PFFacebookUtils initializeFacebook];
    
    if (![PFUser currentUser]) {
        // Customize the Log In View Controller
        PROJ1LoginViewController *logInViewController = [[PROJ1LoginViewController alloc] init];
        [logInViewController setDelegate:self];
        [logInViewController setFacebookPermissions:[NSArray arrayWithObjects:@"friends_about_me", nil]];
        [logInViewController setFields: PFLogInFieldsFacebook];
        
        // Present Log In View Controller
        [self presentViewController:logInViewController animated:NO completion:nil];
    }
}

- (void)logInViewController:(PFLogInViewController *)logInController didLogInUser:(PFUser *)user {
    [self dismissViewControllerAnimated:NO completion:^{
        
        // Create request for user's Facebook data
        FBRequest *request = [FBRequest requestForMe];
        
        // Send request to Facebook
        [request startWithCompletionHandler:^(FBRequestConnection *connection, id result, NSError *error) {
            if (!error) {
                // result is a dictionary with the user's Facebook data
                NSDictionary *userData = (NSDictionary *)result;
                
                NSString *facebookID = userData[@"id"];
                NSString *name = userData[@"name"];
                
                NSURL *pictureURL = [NSURL URLWithString:[NSString stringWithFormat:@"https://graph.facebook.com/%@/picture?type=large&return_ssl_resources=1", facebookID]];
                
                NSData *imageData = [NSData dataWithContentsOfURL:pictureURL];
                
                UIImage *image = [UIImage imageWithData:imageData];
                
                PROJ1UserInfoSingleton *userInfo = [PROJ1UserInfoSingleton sharedManager];
                [userInfo setNome:name];
                [userInfo setFoto:image];
                
                //NSLog(@"Name %@", name);
            }else{
                NSLog(@"%@",error);
            }
        }];

        NSArray *arrayOfPreferences = [[PFUser currentUser] objectForKey:@"entidadePref"];
        
        if (arrayOfPreferences.count < 1) {
            UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"Main-iPhone"
                                                                 bundle:nil];
            UINavigationController *add = [storyboard instantiateViewControllerWithIdentifier:@"selecionarInteressesView"];
            [self presentViewController:add animated:NO completion:nil];
        }
        
    }];
    
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

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSLog(@"1");
    if([[segue identifier] isEqualToString:@"SegueEntidadeProfile"])
    {
        
        NSLog(@"2");
        PROJ1EntidadeViewController *smvc = (PROJ1EntidadeViewController *)segue.destinationViewController;
        
        
        PROJ1Entidade *entidadeSegue = [[PROJ1Entidade alloc] init];
        UIButton *buttonTemp = (UIButton *)[sender viewWithTag:101];
        
        
#warning PEGAR INSTITUICAO NO PARSE COM nome abaixo e prencher
        
        entidadeSegue.nomeEntidade = buttonTemp.titleLabel.text;
        entidadeSegue.descricaoEntidade = @"Descricao Teste aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa";
        entidadeSegue.latitude = [NSNumber numberWithDouble:-30.];
        entidadeSegue.longitude = [NSNumber numberWithDouble:50.];
        
    
        PFQuery *query = [PFQuery queryWithClassName:@"Instituicoes"];
        [query whereKey:@"name" equalTo:buttonTemp.titleLabel.text];
        NSArray* instituicaoArray = [query findObjects];
        
        entidadeSegue.descricaoEntidade = [instituicaoArray firstObject][@"description"];
        entidadeSegue.latitude = [instituicaoArray firstObject][@"latitude"];
        entidadeSegue.longitude = [instituicaoArray firstObject][@"longitude"];
        entidadeSegue.interesses = [instituicaoArray firstObject][@"tipo"];
        NSArray *historico = [instituicaoArray firstObject][@"historicoPessoas"];
        entidadeSegue.qtdDeCheckIns = historico.count;
        smvc.entidadeParaMostrar = entidadeSegue;
        
    }
}

@end
