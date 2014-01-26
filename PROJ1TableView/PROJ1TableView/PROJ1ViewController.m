//
//  PROJ1ViewController.m
//  PROJ1TableView
//
//  Created by Txai Wieser on 20/01/14.
//  Copyright (c) 2014 com.TDW.app. All rights reserved.
//

#import "PROJ1ViewController.h"

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

#define TITLEHEIGHT 30
#define TOPMARGIN 6
    
    // ADICIONA TITULO NA CELULA
    UILabel *titleCellLabel = [[UILabel alloc] initWithFrame:CGRectMake(2, TOPMARGIN, cell.bounds.size.width-2, TITLEHEIGHT)];
    [titleCellLabel setTextAlignment:NSTextAlignmentCenter];
    titleCellLabel.text = @"TITULO";
    titleCellLabel.font = [UIFont fontWithName:@"Helvetica" size:30];
    [cell addSubview:titleCellLabel];
    
    
    //ADICIONA IMAGEM NA CELULA
    
    // Image settings
    UIImage *image = [UIImage imageNamed:[self.photosName objectAtIndex:indexPath.row]];
    // reducing the image size
#define IMAGEMARGINWIDTH 12
    int imageSizeInt = cell.bounds.size.width-(2*IMAGEMARGINWIDTH);
    CGSize newSize = CGSizeMake(imageSizeInt, imageSizeInt);
    UIGraphicsBeginImageContext( newSize );
    [image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    // cropping the image
    
    CGRect clippedRect  = CGRectMake(0, 0, imageSizeInt, imageSizeInt);
    CGImageRef imageRef = CGImageCreateWithImageInRect([newImage CGImage], clippedRect);
    UIImage *newNewImage = [UIImage imageWithCGImage:imageRef];
    CGImageRelease(imageRef);
    UIImageView *imageViewCell = [[UIImageView alloc]initWithFrame:CGRectMake(IMAGEMARGINWIDTH, TOPMARGIN+TITLEHEIGHT+10, imageSizeInt, imageSizeInt)];
    imageViewCell.image = newNewImage;
    [cell addSubview:imageViewCell];
    // making the image rounded
    
//    cell.imageView.frame = cell.frame;
//    cell.imageView.layer.cornerRadius = imageSizeInt/2; //image.size.width/2;
//    cell.imageView.layer.masksToBounds = YES;
    
#define BOTTOMIMAGESIZE 40
    UIButton *likeButtonsCell = [[UIButton alloc] initWithFrame:CGRectMake(IMAGEMARGINWIDTH, TOPMARGIN+TITLEHEIGHT+imageSizeInt+15, imageSizeInt/2 -4, BOTTOMIMAGESIZE)];
    

    [likeButtonsCell.titleLabel setTextAlignment:NSTextAlignmentLeft];
    [likeButtonsCell setTitle:@"Likes" forState:UIControlStateNormal];
    [likeButtonsCell setBackgroundColor:[UIColor greenColor]];
    [cell addSubview:likeButtonsCell];
    
    UIButton *commentButtonsCell = [[UIButton alloc] initWithFrame:CGRectMake(IMAGEMARGINWIDTH+imageSizeInt/2 +4, TOPMARGIN+TITLEHEIGHT+imageSizeInt+15, imageSizeInt/2 -4, BOTTOMIMAGESIZE)];
    
    
    [commentButtonsCell.titleLabel setTextAlignment:NSTextAlignmentRight];
    [commentButtonsCell setTitle:@"Comentários" forState:UIControlStateNormal];
    [commentButtonsCell setBackgroundColor:[UIColor greenColor]];
    [cell addSubview:commentButtonsCell];
    

    return cell;
    
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.timeLineTableView.allowsSelection = NO;

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
        //[self.navigationController setNavigationBarHidden:YES animated:YES];
        [UIView animateWithDuration:3. animations:^{
        [self.navigationController setNavigationBarHidden:YES animated:YES];
        }];
        
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
