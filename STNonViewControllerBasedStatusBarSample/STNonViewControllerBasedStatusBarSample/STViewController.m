//
//  STViewController.m
//  STNonViewControllerBasedStatusBarSample
//
//  Created by EIMEI on 2014/01/18.
//  Copyright (c) 2014年 stack3. All rights reserved.
//

#import "STViewController.h"
#import "STContentViewController.h"

@interface STViewController ()

@property (weak, nonatomic) IBOutlet UIButton *navigationControllerButton;
@property (weak, nonatomic) IBOutlet UIButton *tabBarControllerButton;

@end

@implementation STViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [_navigationControllerButton addTarget:self action:@selector(didTapNavigationControllerButton) forControlEvents:UIControlEventTouchUpInside];
    [_tabBarControllerButton addTarget:self action:@selector(didTapTabBarControllerButton) forControlEvents:UIControlEventTouchUpInside];
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

@end
