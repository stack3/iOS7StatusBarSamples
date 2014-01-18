//
//  STViewController.m
//  STViewControllerBasedStatusBarSample
//
//  Created by EIMEI on 2014/01/18.
//  Copyright (c) 2014年 stack3. All rights reserved.
//

#import "STViewController.h"
#import "STContentViewController.h"

@interface STViewController ()

@property (weak, nonatomic) IBOutlet UIButton *navigationControllerButton;
@property (weak, nonatomic) IBOutlet UIButton *tabBarControllerButton;
@property (weak, nonatomic) IBOutlet UIButton *hideStatusBarButton;
@property (nonatomic) BOOL currentStatusBarHidden;

@end

@implementation STViewController

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

- (BOOL)prefersStatusBarHidden
{
    return _currentStatusBarHidden;
}

- (void)setCurrentStatusBarHidden:(BOOL)currentStatusBarHidden animated:(BOOL)animated
{
    _currentStatusBarHidden = currentStatusBarHidden;
    if (animated) {
        [UIView animateWithDuration:0.3 animations:^{
            [self setNeedsStatusBarAppearanceUpdate];
        }];
    } else {
        [self setNeedsStatusBarAppearanceUpdate];
    }
}

- (UIStatusBarAnimation)preferredStatusBarUpdateAnimation
{
    return UIStatusBarAnimationSlide;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    [_navigationControllerButton addTarget:self action:@selector(didTapNavigationControllerButton) forControlEvents:UIControlEventTouchUpInside];
    [_tabBarControllerButton addTarget:self action:@selector(didTapTabBarControllerButton) forControlEvents:UIControlEventTouchUpInside];
    [_hideStatusBarButton addTarget:self action:@selector(didTapHideStatusBarButton) forControlEvents:UIControlEventTouchUpInside];
}

- (void)didTapNavigationControllerButton
{
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"STContentViewController" bundle:nil];
    STContentViewController *con = [sb instantiateInitialViewController];
    con.title = @"Navigation";

    UINavigationController *naviCon = [[UINavigationController alloc] initWithRootViewController:con];
    naviCon.navigationBar.barTintColor = [UIColor grayColor];
    [self presentViewController:naviCon animated:YES completion:nil];
}

- (void)didTapTabBarControllerButton
{
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"STContentViewController" bundle:nil];

    STContentViewController *con1 = [sb instantiateInitialViewController];
    con1.title = @"Tab1";
    UINavigationController *naviCon1 = [[UINavigationController alloc] initWithRootViewController:con1];
    naviCon1.navigationBar.barTintColor = [UIColor grayColor];
    
    STContentViewController *con2 = [sb instantiateInitialViewController];
    con2.title = @"Tab2";
    UINavigationController *naviCon2 = [[UINavigationController alloc] initWithRootViewController:con2];
    naviCon2.navigationBar.barTintColor = [UIColor grayColor];
    
    STContentViewController *con3 = [sb instantiateInitialViewController];
    con3.title = @"Tab3";
    UINavigationController *naviCon3 = [[UINavigationController alloc] initWithRootViewController:con3];
    naviCon3.navigationBar.barTintColor = [UIColor grayColor];
    
    UITabBarController *tabBarCon = [[UITabBarController alloc] init];
    tabBarCon.viewControllers = @[naviCon1, naviCon2, naviCon3];
    [self presentViewController:tabBarCon animated:YES completion:nil];
}

- (void)didTapHideStatusBarButton
{
    [self setCurrentStatusBarHidden:!_currentStatusBarHidden animated:YES];
    if (_currentStatusBarHidden) {
        [_hideStatusBarButton setTitle:@"Show StatusBar" forState:UIControlStateNormal];
    } else {
        [_hideStatusBarButton setTitle:@"Hide StatusBar" forState:UIControlStateNormal];
    }
}

@end
