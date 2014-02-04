//
//  PROJ1LoginViewController.m
//  PROJ1cbl
//
//  Created by Cleber Henriques on 04/02/14.
//  Copyright (c) 2014 com.TDW.app. All rights reserved.
//

#import "PROJ1LoginViewController.h"

@implementation PROJ1LoginViewController

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
