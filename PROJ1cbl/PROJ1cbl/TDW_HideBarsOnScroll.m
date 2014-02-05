//
//  TDW_HideBarsOnScroll.m
//  PROJ1cbl
//
//  Created by Txai Wieser on 05/02/14.
//  Copyright (c) 2014 com.TDW.app. All rights reserved.
//

#import "TDW_HideBarsOnScroll.h"

@interface TDW_HideBarsOnScroll ()

@property (nonatomic) int previousScrollViewYOffset;

@end

@implementation TDW_HideBarsOnScroll


- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGRect topFrame = self.navigationController.navigationBar.frame;
    CGRect bottomFrame = self.tabBarController.tabBar.frame;
    CGRect centerButtonFrame = [self.tabBarController.view viewWithTag:17712].frame;
    
    CGFloat topSize = topFrame.size.height - 21;
    CGFloat bottomSize = bottomFrame.size.height;
    CGFloat centralButtonBottomBarSize = centerButtonFrame.size.height;
    CGFloat FramePercentageHidden = ((20 - topFrame.origin.y) / (topFrame.size.height - 1));
    
    CGFloat scrollOffset = scrollView.contentOffset.y;
    CGFloat scrollDiff = scrollOffset - self.previousScrollViewYOffset;
    CGFloat scrollHeight = scrollView.frame.size.height;
    CGFloat scrollContentSizeHeight = scrollView.contentSize.height + scrollView.contentInset.bottom;
    
#define POSYCOMECOBOTTOMBAR 568-49
#define POSYCOMECOBOTAOCENTRALBOTTOMBAR 500
    
    if (scrollOffset <= -scrollView.contentInset.top) {
        //posição inicial
        topFrame.origin.y = 20;
        bottomFrame.origin.y = POSYCOMECOBOTTOMBAR;
        centerButtonFrame.origin.y = POSYCOMECOBOTAOCENTRALBOTTOMBAR;
        
    } else if ((scrollOffset + scrollHeight) >= scrollContentSizeHeight) {
        //
        topFrame.origin.y = -topSize;
        bottomFrame.origin.y = POSYCOMECOBOTTOMBAR+bottomSize;
        centerButtonFrame.origin.y = POSYCOMECOBOTAOCENTRALBOTTOMBAR+centralButtonBottomBarSize;
        
    } else {
        topFrame.origin.y = MIN(20, MAX(-topSize, topFrame.origin.y - scrollDiff));
        bottomFrame.origin.y = MAX(POSYCOMECOBOTTOMBAR, MIN(POSYCOMECOBOTTOMBAR+bottomSize, bottomFrame.origin.y + scrollDiff));
        centerButtonFrame.origin.y = MAX(POSYCOMECOBOTAOCENTRALBOTTOMBAR, MIN(POSYCOMECOBOTAOCENTRALBOTTOMBAR+centralButtonBottomBarSize, centerButtonFrame.origin.y +scrollDiff));
    }
    
    [self.navigationController.navigationBar setFrame:topFrame];
    [self.tabBarController.tabBar setFrame:bottomFrame];
    [[self.tabBarController.view viewWithTag:17712] setFrame:centerButtonFrame];
    
    [self updateTopBarButtonItems:(1 - FramePercentageHidden)];
    [self updateBottomBarButtonItems:(1 - FramePercentageHidden)];
    
    self.previousScrollViewYOffset = scrollOffset;
    
    
    
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    [self stoppedScrolling];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView
                  willDecelerate:(BOOL)decelerate
{
    if (!decelerate) {
        [self stoppedScrolling];
    }
}

- (void)stoppedScrolling
{
    CGRect frame = self.navigationController.navigationBar.frame;
    if (frame.origin.y < 20) {
        [self animateNavBarTo:-(frame.size.height - 21)];
    }
    
    frame = self.tabBarController.tabBar.frame;
    CGRect frameCenterButton = [self.tabBarController.view viewWithTag:17712].frame;
    
    if (frame.origin.y > POSYCOMECOBOTTOMBAR) {
        [self animateBottomBarTo:POSYCOMECOBOTTOMBAR+frame.size.height and:POSYCOMECOBOTTOMBAR+frameCenterButton.size.height];
    }
    
}

- (void)animateBottomBarTo:(CGFloat)y and:(CGFloat)y2
{
    [UIView animateWithDuration:0.3 animations:^{
        CGRect frame = self.tabBarController.tabBar.frame;
        CGRect frameCenterButton = [self.tabBarController.view viewWithTag:17712].frame;
        CGFloat alpha = (frame.origin.y >= y ? 0 : 1);
        
        frame.origin.y = y;
        frameCenterButton.origin.y = y2;
        [self.tabBarController.tabBar setFrame:frame];
        [[self.tabBarController.view viewWithTag:17712] setFrame:frameCenterButton];
        [self updateBottomBarButtonItems:alpha];
    }];
}


- (void)animateNavBarTo:(CGFloat)y
{
    [UIView animateWithDuration:0.3 animations:^{
        CGRect frame = self.navigationController.navigationBar.frame;
        CGFloat alpha = (frame.origin.y >= y ? 0 : 1);
        frame.origin.y = y;
        [self.navigationController.navigationBar setFrame:frame];
        [self updateTopBarButtonItems:alpha];
    }];
}

- (void)updateTopBarButtonItems:(CGFloat)alpha
{
    NSLog(@"TOP: %f",alpha);
    
    [self.navigationItem.leftBarButtonItems enumerateObjectsUsingBlock:^(UIBarButtonItem* item, NSUInteger i, BOOL *stop) {
        item.customView.alpha = alpha;
    }];
    [self.navigationItem.rightBarButtonItems enumerateObjectsUsingBlock:^(UIBarButtonItem* item, NSUInteger i, BOOL *stop) {
        item.customView.alpha = alpha;
    }];
    [self.navigationItem.titleView setAlpha:alpha];
    [self.navigationController.navigationBar.subviews[1] setAlpha:alpha];
    
}

- (void)updateBottomBarButtonItems:(CGFloat)alpha
{
    NSLog(@"%f",alpha);
    //    UITabBarController *o1 = self.tabBarController;
    //    NSArray *o2 = o1.viewControllers;
    //    UIViewController *o3 = [o2 firstObject];
    //    NSLog(@"%@",o3);
    //    UIView *o4 = o3.view;
    //    [o4 setAlpha:alpha];
    //
    
    //[[[self.tabBarController.viewControllers firstObject] viewWithTag:1010] setAlpha:alpha];
    //    [self.tabBarController.viewControllers enumerateObjectsUsingBlock:^(UIView* item, NSUInteger i, BOOL *stop) {
    //        item.alpha = alpha;
    //        //NSLog(@"oi");
    //    }];
    [self.tabBarController.tabBar.subviews[1] setAlpha:alpha];
    [self.tabBarController.tabBar.subviews[2] setAlpha:alpha];
    [self.tabBarController.tabBar.subviews[3] setAlpha:alpha];
    [self.tabBarController.tabBar.subviews[4] setAlpha:alpha];
    [self.tabBarController.tabBar.subviews[5] setAlpha:alpha];
    [[self.tabBarController.view viewWithTag:17712] setAlpha:alpha];
    
    NSLog(@"%@",[self.tabBarController.tabBar.subviews[5] class]);
    
    
    //[self.navigationItem.rightBarButtonItems enumerateObjectsUsingBlock:^(UIBarButtonItem* item, NSUInteger i, BOOL *stop) {
    //    item.customView.alpha = alpha;
    //}];
    //[self.navigationItem.titleView setAlpha:alpha];
    //[self.navigationItem.titleView setAlpha:alpha];
    // self.navigationController.navigationBar.tintColor = [self.navigationController.navigationBar.tintColor colorWithAlphaComponent:alpha];
}

@end
