//
//  MainViewController.m
//  IOS7Animation
//
//  Created by 陈政 on 14-1-21.
//  Copyright (c) 2014年 Apple Inc. All rights reserved.
//

#import "MainViewController.h"
#import "ModalViewController.h"
#import "BouncePresentAnimation.h"

#import "SwipeUpInteractiveTransition.h"
#import "NormalDismissAnimation.h"

@interface MainViewController () <ModalViewControllerDelegate, UIViewControllerTransitioningDelegate>

@property (nonatomic , strong) BouncePresentAnimation *presentAnimation;

@property (nonatomic , strong) SwipeUpInteractiveTransition *transitionController;
@property (nonatomic , strong) NormalDismissAnimation *dismissAnimation;

@end

@implementation MainViewController

- (id)init
{
    if ((self = [super init])) {
        self.presentAnimation = [[BouncePresentAnimation alloc] init];
        
        self.transitionController = [[SwipeUpInteractiveTransition alloc] init];
        self.dismissAnimation = [[NormalDismissAnimation alloc] init];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(80, 210, 160, 40);
    [button setTitle:@"Click me" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)buttonClicked:(id)sender
{
    ModalViewController *mvc = [[ModalViewController alloc] init];
    mvc.delegate = self;
    mvc.transitioningDelegate = self;
    [self.transitionController wireToViewController:mvc];
    [self presentViewController:mvc animated:YES completion:NULL];
}

- (void)modalViewControllerDidClickedDismissButton:(ModalViewController *)viewController
{
    [self dismissViewControllerAnimated:YES completion:NULL];
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    return self.presentAnimation;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    return self.dismissAnimation;
}

- (id<UIViewControllerInteractiveTransitioning>)interactionControllerForDismissal:(id<UIViewControllerAnimatedTransitioning>)animator
{
    return self.transitionController.interacting?self.transitionController:nil;
}

@end
