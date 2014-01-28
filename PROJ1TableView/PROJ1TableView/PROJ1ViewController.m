//
//  PROJ1ViewController.m
//  PROJ1TableView
//
//  Created by Txai Wieser on 20/01/14.
//  Copyright (c) 2014 com.TDW.app. All rights reserved.
//

#import "PROJ1ViewController.h"
#import <Parse/Parse.h>

@interface PROJ1ViewController ()
@property (weak, nonatomic) IBOutlet UITableView *timeLineTableView;
@property (nonatomic) CGPoint lastOffset;
@end

@implementation PROJ1ViewController



- (NSArray *)photosName
{
    NSArray *myArray = [NSArray arrayWithObjects:@"Arvore.jpg", @"Praia.jpg", @"Aguas.jpg", @"Onda.jpg", @"Breaking Bad.jpg", @"Cachoeira.jpg", @"Caminho.jpg", @"Cosmos.jpg", @"Leopard Screen.jpg", @"Milky Way.jpg", @"The Road.jpg", @"iPhone Generations.jpg", nil];
    NSSortDescriptor* sortOrder = [NSSortDescriptor sortDescriptorWithKey: @"self" ascending: YES];
    return [myArray sortedArrayUsingDescriptors: [NSArray arrayWithObject: sortOrder]];
}




-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return 12;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    return 460;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"TimeLineCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...

    // ADICIONA TITULO NA CELULA
    UILabel *titleCellLabel = (UILabel *)[cell viewWithTag:100];
    [titleCellLabel setTextAlignment:NSTextAlignmentCenter];
    titleCellLabel.text = @"TITULO";
    //titleCellLabel.textColor = [UIColor colorWithRed:46/255. green:204/255. blue:113/255. alpha:1.0];
    titleCellLabel.font = [UIFont fontWithName:@"HelveticaNeue-UltraLight" size:30];
    
    //ADICIONA IMAGEM NA CELULA
    
    // Image settings
    UIImageView *cellImageView = (UIImageView *)[cell viewWithTag:101];
    UIImage *image = [UIImage imageNamed:[self.photosName objectAtIndex:indexPath.row]];
    // reducing the image size
    CGSize newSize = CGSizeMake(cellImageView.frame.size.width, cellImageView.frame.size.height);
    UIGraphicsBeginImageContext( newSize );
    [image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
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
    [likeButtonsCell setTitle:@"Likes" forState:UIControlStateNormal];
    //[likeButtonsCell setBackgroundColor:[UIColor greenColor]];
    
    UIButton *commentButtonsCell = (UIButton *)[cell viewWithTag:111];
    
    [commentButtonsCell.titleLabel setTextAlignment:NSTextAlignmentRight];
    [commentButtonsCell setTitle:@"Comentários" forState:UIControlStateNormal];
    //[commentButtonsCell setBackgroundColor:[UIColor greenColor]];
    

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
    [headerViewSelectionButtons addSubview:segmentButtons];
    
    self.timeLineTableView.tableHeaderView = headerViewSelectionButtons;

}


- (void)loginParseUserInfo
{
    
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
