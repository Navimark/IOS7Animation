//
//  ModalViewController.h
//  IOS7Animation
//
//  Created by 陈政 on 14-1-21.
//  Copyright (c) 2014年 Apple Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ModalViewController;

@protocol ModalViewControllerDelegate <NSObject>

- (void)modalViewControllerDidClickedDismissButton:(ModalViewController *)viewController;

@end



@interface ModalViewController : UIViewController

@property (nonatomic , weak) id<ModalViewControllerDelegate> delegate;

@end
