//
//  PROJ1PrefetencesViewController.m
//  PROJ1cbl
//
//  Created by Txai Wieser on 04/02/14.
//  Copyright (c) 2014 com.TDW.app. All rights reserved.
//

#import "PROJ1PrefetencesViewController.h"
#import "PROJ1SettingInstitutionPreferencesViewController.h"

@interface PROJ1PrefetencesViewController ()

@end

@implementation PROJ1PrefetencesViewController

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
- (IBAction)editarMeusInteressesButton {

    UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"Main-iPhone"
                                                         bundle:nil];
    UINavigationController *add = [storyboard instantiateViewControllerWithIdentifier:@"selecinarInteressesView"];

    [self presentViewController:add animated:YES completion:nil];
}


@end
