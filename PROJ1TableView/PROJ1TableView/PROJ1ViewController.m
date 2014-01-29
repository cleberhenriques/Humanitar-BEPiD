//
//  PROJ1ViewController.m
//  PROJ1TableView
//
//  Created by Txai Wieser on 20/01/14.
//  Copyright (c) 2014 com.TDW.app. All rights reserved.
//

#import "PROJ1ViewController.h"
#import <Parse/Parse.h>
#import "PROJ1Evento.h"

@interface PROJ1ViewController ()
@property (weak, nonatomic) IBOutlet UITableView *timeLineTableView;
@property (nonatomic) CGPoint lastOffset;
@property (strong, nonatomic) NSArray *arrayOfEvents; // contem objetos do tipo EVENTO para serem mostrados na timeline.
@property (nonatomic) int selectedTimeLineFilter;

@end

@implementation PROJ1ViewController


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
        ///////////////////////////////////////
        for (int i=0; i<12; i++) {
            PROJ1Evento *umEventoTemporario = [[PROJ1Evento alloc] init];
            
            umEventoTemporario.nomeDoEvento = [NSString stringWithFormat:@"Post %d",i+1];
            umEventoTemporario.descricaoDoEvento = [NSString stringWithFormat:@"Descricao do evento de numero %d",i+1];
            NSLog(@"%d",i);
            NSArray *myArray = [NSArray arrayWithObjects:@"The Road.jpg", @"Arvore.jpg", @"Praia.jpg", @"Aguas.jpg", @"Onda.jpg", @"Breaking Bad.jpg", @"Cachoeira.jpg", @"Caminho.jpg", @"Cosmos.jpg", @"Leopard Screen.jpg", @"Milky Way.jpg", @"iPhone Generations.jpg", nil];
            
            umEventoTemporario.albumDeFotosDoEvento = [NSArray arrayWithObject:[UIImage imageNamed:myArray[i]]];
            
            [arrayDeEventosTemporario addObject:umEventoTemporario];
            
        }
        ///////////////////////////////////////
    }
    else if (self.selectedTimeLineFilter == 1) {
        ///////////////////////////////////////
        for (int i=0; i<4; i++) {
            PROJ1Evento *umEventoTemporario = [[PROJ1Evento alloc] init];
            
            umEventoTemporario.nomeDoEvento = [NSString stringWithFormat:@"Post %d",i+1];
            umEventoTemporario.descricaoDoEvento = [NSString stringWithFormat:@"Descricao do evento de numero %d",i+1];
            NSLog(@"%d",i);
            NSArray *myArray = [NSArray arrayWithObjects:@"Onda.jpg", @"Breaking Bad.jpg", @"Cachoeira.jpg", @"Caminho.jpg", @"Cosmos.jpg", nil];
            
            umEventoTemporario.albumDeFotosDoEvento = [NSArray arrayWithObject:[UIImage imageNamed:myArray[i]]];
            
            [arrayDeEventosTemporario addObject:umEventoTemporario];
            
        }
        ///////////////////////////////////////
    }
    else if (self.selectedTimeLineFilter == 2) {
        ///////////////////////////////////////
        for (int i=0; i<2; i++) {
            PROJ1Evento *umEventoTemporario = [[PROJ1Evento alloc] init];
            
            umEventoTemporario.nomeDoEvento = [NSString stringWithFormat:@"Post %d",i+1];
            umEventoTemporario.descricaoDoEvento = [NSString stringWithFormat:@"Descricao do evento de numero %d",i+1];
            NSLog(@"%d",i);
            NSArray *myArray = [NSArray arrayWithObjects:@"Milky Way.jpg", @"The Road.jpg", @"iPhone Generations.jpg", nil];
            
            umEventoTemporario.albumDeFotosDoEvento = [NSArray arrayWithObject:[UIImage imageNamed:myArray[i]]];
            
            [arrayDeEventosTemporario addObject:umEventoTemporario];
            
        }
        ///////////////////////////////////////
        
    }
    
    
    return arrayDeEventosTemporario;

}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return self.arrayOfEvents.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"TimeLineCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...

    PROJ1Evento *eventoDaCell = self.arrayOfEvents[indexPath.row];
    // ADICIONA TITULO NA CELULA
    UILabel *titleCellLabel = (UILabel *)[cell viewWithTag:100];
    [titleCellLabel setTextAlignment:NSTextAlignmentCenter];
    titleCellLabel.text = eventoDaCell.nomeDoEvento;
    //titleCellLabel.textColor = [UIColor colorWithRed:46/255. green:204/255. blue:113/255. alpha:1.0];
    titleCellLabel.font = [UIFont fontWithName:@"HelveticaNeue-UltraLight" size:30];
    
    //ADICIONA IMAGEM NA CELULA
    
    // Image settings
    UIImageView *cellImageView = (UIImageView *)[cell viewWithTag:101];
    UIImage *image = [eventoDaCell.albumDeFotosDoEvento firstObject];
    // reducing the image size
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
    
    [cellImageView setImage:newNewImage];
    
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
    descricaoEventoLabel.text = eventoDaCell.descricaoDoEvento;
    
    
    return cell;
    
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self loginParseUserInfo];

    self.timeLineTableView.allowsSelection = NO;
    self.title = @"TimeLine";
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:46/255. green:204/255. blue:113/255. alpha:1.0]];
    
    
    UIView *headerViewSelectionButtons = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.timeLineTableView.frame.size.width, 46)];
    
    //headerViewSelectionButtons.backgroundColor = [UIColor greenColor];
#define MARGINHEADERSEGMENT 6
    
    UISegmentedControl *segmentButtons = [[UISegmentedControl alloc] initWithItems:[NSArray arrayWithObjects:@"News", @"Próximo", @"??" ,nil]];
    segmentButtons.frame = CGRectMake(MARGINHEADERSEGMENT, MARGINHEADERSEGMENT, headerViewSelectionButtons.frame.size.width-(2*MARGINHEADERSEGMENT), headerViewSelectionButtons.frame.size.height-(2*MARGINHEADERSEGMENT));
    
    [segmentButtons addTarget:self action:@selector(didJustChangeOptionOnSegmentedControl:) forControlEvents:UIControlEventValueChanged];
    [segmentButtons setSelectedSegmentIndex:0];
    
    [headerViewSelectionButtons addSubview:segmentButtons];
    
    
    self.timeLineTableView.tableHeaderView = headerViewSelectionButtons;

}

- (void)didJustChangeOptionOnSegmentedControl:(UISegmentedControl *)segment
{
    self.selectedTimeLineFilter = segment.selectedSegmentIndex;
    self.arrayOfEvents = nil;
    [self.timeLineTableView reloadData];
}

- (void)loginParseUserInfo
{
    PFUser *user = [PFUser user];
    user.username = @"my name";
    user.password = @"my pass";
    user.email = @"email@example.com";
    
    // other fields can be set if you want to save more information
    user[@"phone"] = @"650-555-0000";
    
    [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (!error) {
            // Hooray! Let them use the app now.
        } else {
            NSString *errorString = [error userInfo][@"error"];
            // Show the errorString somewhere and let the user try again.
            NSLog(@"%@", errorString);
        }
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    NSLog(@"MEMORY WARNING");
}


- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    self.lastOffset = scrollView.contentOffset;
    
}

- (void)scrollViewDidScroll :(UIScrollView *)scrollView {
    if (scrollView.contentOffset.y > self.lastOffset.y) {
        // hide
        [self.navigationController setNavigationBarHidden:YES animated:YES];
        
    } else{
        // unhide
        [self.navigationController setNavigationBarHidden:NO animated:YES];

    }
    
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
