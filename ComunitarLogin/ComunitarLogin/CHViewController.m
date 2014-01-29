//
//  CHViewController.m
//  ComunitarLogin
//
//  Created by Cleber Henriques on 27/01/14.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import "CHViewController.h"

@interface CHViewController ()

@end

@implementation CHViewController

- (void)viewDidLoad
{
    PFUser *user = [PFUser user];
    user.username = @"cleber";
    user.password = @"123";
    user.email = @"email@example.com";
    
    [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (!error) {
            NSLog(@"Logged");
        } else {
            NSString *errorString = [error userInfo][@"error"];
            NSLog(@"Error %@", errorString);
        }
    }];
    
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
