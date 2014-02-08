//
//  PROJ1InitialTabBarViewController.m
//  PROJ1cbl
//
//  Created by Txai Wieser on 1/30/14.
//  Copyright (c) 2014 com.TDW.app. All rights reserved.
//

#import "PROJ1InitialTabBarViewController.h"

@interface PROJ1InitialTabBarViewController ()

@end

@implementation PROJ1InitialTabBarViewController

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

    UIViewController *emptyViewController = [[UIViewController alloc] init];

    NSMutableArray *arrayOfViewControllersTemp = [[NSMutableArray alloc] initWithArray:self.viewControllers];
    
    [arrayOfViewControllersTemp insertObject:emptyViewController atIndex:2];

    self.viewControllers = (NSArray *)arrayOfViewControllersTemp;
    arrayOfViewControllersTemp = nil;

    
}

-(void)viewWillAppear:(BOOL)animated
{
    [self addCenterButtonWithImage:[UIImage imageNamed:@"check-icon.png"] highlightImage:[UIImage imageNamed:@"check-icon-press.png"]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) addCenterButtonWithImage:(UIImage*)buttonImage highlightImage:(UIImage*)highlightImage
{
    UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleTopMargin;
    button.frame = CGRectMake(0.0, 0.0, buttonImage.size.width, buttonImage.size.height);
    [button setBackgroundImage:buttonImage forState:UIControlStateNormal];
    [button setBackgroundImage:highlightImage forState:UIControlStateHighlighted];
    
    CGFloat heightDifference = buttonImage.size.height - self.tabBar.frame.size.height;
    if (heightDifference < 0)
        button.center = self.tabBar.center;
    else
    {
        CGPoint center = self.tabBar.center;
        center.y = center.y - heightDifference/2.0;
        button.center = center;
    }
    
    [button addTarget:self action:@selector(checkInButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    [button setTag:17712];
    [self.view addSubview:button];
    
}

- (void)checkInButtonClicked
{
    [self performSegueWithIdentifier:@"modalSegueToCheckInView" sender:self];
}


@end
