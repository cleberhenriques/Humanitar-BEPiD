//
//  PROJ1ViewController.m
//  PROJ1TableView
//
//  Created by Txai Wieser on 20/01/14.
//  Copyright (c) 2014 com.TDW.app. All rights reserved.
//

#import "PROJ1ViewController.h"

@interface PROJ1ViewController ()

@end

@implementation PROJ1ViewController


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *aCell = [[UITableViewCell alloc] initWithFrame:CGRectMake(0, 0, <#CGFloat width#>, 50)];
    
    UIImageView *aImageView = [[UIImageView alloc] initWithFrame:CGRectMake(30, 30, aCell.bounds.size.width, aCell.bounds.size.height)];
    
    [aImageView setBackgroundColor:[UIColor greenColor]];
    
    //aImageView.image = [UIImage imageNamed:@"aImage.png"];
    [aCell addSubview:aImageView];
    
    return aCell;
}

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
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
