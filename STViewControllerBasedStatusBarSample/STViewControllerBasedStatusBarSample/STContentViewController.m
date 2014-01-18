//
//  STContentViewController.m
//  STViewControllerBasedStatusBarSample
//
//  Created by EIMEI on 2014/01/18.
//  Copyright (c) 2014年 stack3. All rights reserved.
//

#import "STContentViewController.h"

@interface STContentViewController ()

@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation STContentViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSLog(@"%@", NSStringFromCGRect(self.view.frame));
    
    _label.text = self.title;

    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Close"
                                                                             style:UIBarButtonItemStylePlain
                                                                            target:self
                                                                            action:@selector(didTapCloseButton)];
}

- (void)didTapCloseButton
{
    if (self.tabBarController) {
        [self.tabBarController dismissViewControllerAnimated:YES completion:nil];
    } else {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    // This ViewController is content of NavigationController or TabController.
    // So preferredStatusBarStyle does not work.
    return UIStatusBarStyleLightContent;
}

@end
