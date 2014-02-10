//
//  PROJ1PrefetencesViewController.m
//  PROJ1cbl
//
//  Created by Txai Wieser on 04/02/14.
//  Copyright (c) 2014 com.TDW.app. All rights reserved.
//

#import "PROJ1PrefetencesViewController.h"
#import "PROJ1SettingInstitutionPreferencesViewController.h"
#import <Parse/Parse.h>

@interface PROJ1PrefetencesViewController ()

@end

@implementation PROJ1PrefetencesViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self.navigationController.navigationBar setBarTintColor: [UIColor colorWithRed:41/255. green:128/255. blue:185/255. alpha:1.0]];
    [self setTitle:@"Preferencias"];
    
}

- (IBAction)removeAcountButton:(id)sender {

    #warning REMOVE USER FROM PARSE
    
    [PFUser logOut];
    [self.tabBarController setSelectedIndex:0];

}

- (IBAction)sairDaContaButton {
    [PFUser logOut];
    [self.tabBarController setSelectedIndex:0];
}

- (IBAction)editarMeusInteressesButton {

    UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"Main-iPhone"
                                                         bundle:nil];
    UINavigationController *add = [storyboard instantiateViewControllerWithIdentifier:@"selecinarInteressesView"];

    [self presentViewController:add animated:YES completion:nil];
}


@end
