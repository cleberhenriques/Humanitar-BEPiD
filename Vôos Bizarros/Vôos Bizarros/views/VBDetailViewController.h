//
//  VBDetailViewController.h
//  k
//
//  Created by Txai Wieser on 12/12/13.
//  Copyright (c) 2013 com.TDW.app. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VBDetailViewController : UIViewController <UISplitViewControllerDelegate>

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
