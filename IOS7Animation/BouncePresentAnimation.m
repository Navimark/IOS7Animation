//
//  BouncePresentAnimation.m
//  IOS7Animation
//
//  Created by 陈政 on 14-1-21.
//  Copyright (c) 2014年 Apple Inc. All rights reserved.
//
/**
 *  弹簧效果的实现
 *
 *
 *
 *
 */
#import "BouncePresentAnimation.h"

@implementation BouncePresentAnimation

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 0.8f;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    //1.get controllers from transition context
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
//    2.set init frame for to VC
    CGRect screeenBounds = [[UIScreen mainScreen] bounds];
    CGRect finalFrame = [transitionContext finalFrameForViewController:toVC];
    toVC.view.frame = CGRectOffset(finalFrame, 0, screeenBounds.size.height);
//    toVC.view.frame = CGRectOffset(finalFrame, screeenBounds.size.width, screeenBounds.size.height);
    
//    3.add to vc's view to container view
    UIView *containerView = [transitionContext containerView];
    [containerView addSubview:toVC.view];
    
    //4.do animation now
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    [UIView animateWithDuration:duration
                          delay:0
         usingSpringWithDamping:0.6
          initialSpringVelocity:0.0
                        options:UIViewAnimationOptionCurveLinear
                     animations:^{
                         toVC.view.frame = finalFrame;
                     } completion:^(BOOL finished) {
                         if (finished) {
                             [transitionContext completeTransition:YES];
                         }
                     }];
    
}

@end
