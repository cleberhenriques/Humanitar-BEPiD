//
//  PROJ1ViewController.m
//  PROJ1TableView
//
//  Created by Txai Wieser on 20/01/14.
//  Copyright (c) 2014 com.TDW.app. All rights reserved.
//

#import "PROJ1InstitutionTableViewController.h"
#import "PROJ1Evento.h"

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

    PROJ1Evento *eventoDaCell = self.arrayOfEvents[indexPath.row];
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
                UIImage *newNewImage = [UIImage imageWithCGImage:imageRef];
                CGImageRelease(imageRef);
                
            }
        }];
    }
    
    // making the image rounded
    
    cellImageView.layer.cornerRadius = cellImageView.frame.size.width/12; //image.size.width/2;
    cellImageView.layer.masksToBounds = YES;

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
    
    [self.navigationController.navigationBar setBarTintColor: [UIColor colorWithRed:0.11 green:0.47 blue:0.58 alpha:1.0]];
    [self.tabBarController.tabBar setBarTintColor:[UIColor colorWithRed:0.11 green:0.47 blue:0.58 alpha:1.0]];
    
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


//- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
//{
//    self.lastOffset = scrollView.contentOffset;
//    
//}
//
//- (void)scrollViewDidScroll :(UIScrollView *)scrollView {
//    if (scrollView.contentOffset.y > self.lastOffset.y) {
//        // hide
//        [self.navigationController setNavigationBarHidden:YES animated:YES];
//        [self.tabBarController.tabBar setHidden:YES];
//        
//    } else{
//        // unhide
//        [self.navigationController setNavigationBarHidden:NO animated:YES];
//        [self.tabBarController.tabBar setHidden:NO];
//    }
//    
//}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/













- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGRect topFrame = self.navigationController.navigationBar.frame;
    CGRect bottomFrame = self.tabBarController.tabBar.frame;
    CGRect centerButtonFrame = [self.tabBarController.view viewWithTag:17712].frame;
    
    CGFloat topSize = topFrame.size.height - 21;
    CGFloat bottomSize = bottomFrame.size.height;
    CGFloat centralButtonBottomBarSize = centerButtonFrame.size.height;
    CGFloat FramePercentageHidden = ((20 - topFrame.origin.y) / (topFrame.size.height - 1));
    
    CGFloat scrollOffset = scrollView.contentOffset.y;
    CGFloat scrollDiff = scrollOffset - self.previousScrollViewYOffset;
    CGFloat scrollHeight = scrollView.frame.size.height;
    CGFloat scrollContentSizeHeight = scrollView.contentSize.height + scrollView.contentInset.bottom;
    
#define POSYCOMECOBOTTOMBAR 568-49
#define POSYCOMECOBOTAOCENTRALBOTTOMBAR 500
    
    if (scrollOffset <= -scrollView.contentInset.top) {
        //posição inicial
        topFrame.origin.y = 20;
        bottomFrame.origin.y = POSYCOMECOBOTTOMBAR;
        centerButtonFrame.origin.y = POSYCOMECOBOTAOCENTRALBOTTOMBAR;
        
    } else if ((scrollOffset + scrollHeight) >= scrollContentSizeHeight) {
        //
        topFrame.origin.y = -topSize;
        bottomFrame.origin.y = POSYCOMECOBOTTOMBAR+bottomSize;
        centerButtonFrame.origin.y = POSYCOMECOBOTAOCENTRALBOTTOMBAR+centralButtonBottomBarSize;
        
    } else {
        topFrame.origin.y = MIN(20, MAX(-topSize, topFrame.origin.y - scrollDiff));
        bottomFrame.origin.y = MAX(POSYCOMECOBOTTOMBAR, MIN(POSYCOMECOBOTTOMBAR+bottomSize, bottomFrame.origin.y + scrollDiff));
        centerButtonFrame.origin.y = MAX(POSYCOMECOBOTAOCENTRALBOTTOMBAR, MIN(POSYCOMECOBOTAOCENTRALBOTTOMBAR+centralButtonBottomBarSize, centerButtonFrame.origin.y +scrollDiff));
    }
    
    [self.navigationController.navigationBar setFrame:topFrame];
    [self.tabBarController.tabBar setFrame:bottomFrame];
    [[self.tabBarController.view viewWithTag:17712] setFrame:centerButtonFrame];
    
    [self updateTopBarButtonItems:(1 - FramePercentageHidden)];
    [self updateBottomBarButtonItems:(1 - FramePercentageHidden)];
    
    self.previousScrollViewYOffset = scrollOffset;
    
    
    
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    [self stoppedScrolling];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView
                  willDecelerate:(BOOL)decelerate
{
    if (!decelerate) {
        [self stoppedScrolling];
    }
}

- (void)stoppedScrolling
{
    CGRect frame = self.navigationController.navigationBar.frame;
    if (frame.origin.y < 20) {
        [self animateNavBarTo:-(frame.size.height - 21)];
    }
    
    frame = self.tabBarController.tabBar.frame;
    CGRect frameCenterButton = [self.tabBarController.view viewWithTag:17712].frame;
    
    if (frame.origin.y > POSYCOMECOBOTTOMBAR) {
        [self animateBottomBarTo:POSYCOMECOBOTTOMBAR+frame.size.height and:POSYCOMECOBOTTOMBAR+frameCenterButton.size.height];
    }
    
}

- (void)animateBottomBarTo:(CGFloat)y and:(CGFloat)y2
{
    [UIView animateWithDuration:0.3 animations:^{
        CGRect frame = self.tabBarController.tabBar.frame;
        CGRect frameCenterButton = [self.tabBarController.view viewWithTag:17712].frame;
        CGFloat alpha = (frame.origin.y >= y ? 0 : 1);
        
        frame.origin.y = y;
        frameCenterButton.origin.y = y2;
        [self.tabBarController.tabBar setFrame:frame];
        [[self.tabBarController.view viewWithTag:17712] setFrame:frameCenterButton];
        [self updateBottomBarButtonItems:alpha];
    }];
}


- (void)animateNavBarTo:(CGFloat)y
{
    [UIView animateWithDuration:0.3 animations:^{
        CGRect frame = self.navigationController.navigationBar.frame;
        CGFloat alpha = (frame.origin.y >= y ? 0 : 1);
        frame.origin.y = y;
        [self.navigationController.navigationBar setFrame:frame];
        [self updateTopBarButtonItems:alpha];
    }];
}

- (void)updateTopBarButtonItems:(CGFloat)alpha
{
    NSLog(@"TOP: %f",alpha);

    [self.navigationItem.leftBarButtonItems enumerateObjectsUsingBlock:^(UIBarButtonItem* item, NSUInteger i, BOOL *stop) {
        item.customView.alpha = alpha;
    }];
    [self.navigationItem.rightBarButtonItems enumerateObjectsUsingBlock:^(UIBarButtonItem* item, NSUInteger i, BOOL *stop) {
        item.customView.alpha = alpha;
    }];
    [self.navigationItem.titleView setAlpha:alpha];
    [self.navigationController.navigationBar.subviews[1] setAlpha:alpha];
    
}

- (void)updateBottomBarButtonItems:(CGFloat)alpha
{
    NSLog(@"%f",alpha);
//    UITabBarController *o1 = self.tabBarController;
//    NSArray *o2 = o1.viewControllers;
//    UIViewController *o3 = [o2 firstObject];
//    NSLog(@"%@",o3);
//    UIView *o4 = o3.view;
//    [o4 setAlpha:alpha];
//    

    //[[[self.tabBarController.viewControllers firstObject] viewWithTag:1010] setAlpha:alpha];
//    [self.tabBarController.viewControllers enumerateObjectsUsingBlock:^(UIView* item, NSUInteger i, BOOL *stop) {
//        item.alpha = alpha;
//        //NSLog(@"oi");
//    }];
    [self.tabBarController.tabBar.subviews[1] setAlpha:alpha];
    [self.tabBarController.tabBar.subviews[2] setAlpha:alpha];
    [self.tabBarController.tabBar.subviews[3] setAlpha:alpha];
    [self.tabBarController.tabBar.subviews[4] setAlpha:alpha];
    [self.tabBarController.tabBar.subviews[5] setAlpha:alpha];
    [[self.tabBarController.view viewWithTag:17712] setAlpha:alpha];
    
    NSLog(@"%@",[self.tabBarController.tabBar.subviews[5] class]);
    
    
    //[self.navigationItem.rightBarButtonItems enumerateObjectsUsingBlock:^(UIBarButtonItem* item, NSUInteger i, BOOL *stop) {
    //    item.customView.alpha = alpha;
    //}];
    //[self.navigationItem.titleView setAlpha:alpha];
    //[self.navigationItem.titleView setAlpha:alpha];
   // self.navigationController.navigationBar.tintColor = [self.navigationController.navigationBar.tintColor colorWithAlphaComponent:alpha];
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
    }else{
        [self performSegueWithIdentifier:@"loggedIn" sender:@"asd"];
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
