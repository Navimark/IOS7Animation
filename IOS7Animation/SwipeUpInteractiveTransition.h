//
//  SwipeUpInteractiveTransition.h
//  IOS7Animation
//
//  Created by 陈政 on 14-1-21.
//  Copyright (c) 2014年 Apple Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SwipeUpInteractiveTransition : UIPercentDrivenInteractiveTransition

@property (nonatomic , assign)BOOL interacting;

- (void)wireToViewController:(UIViewController *)viewController;

@end
