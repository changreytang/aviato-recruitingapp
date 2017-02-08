//
// Created by Stephen Marquis on 4/29/14.
// Copyright (c) 2014 Workday. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WDGenericViewController.h"

@class WDNavigationController;

extern NSString * const WDStyledModalDidResizeForKeyboardNotification;

@interface WDStyledModalViewController : WDGenericViewController<UINavigationControllerDelegate>

@property (nonatomic, readonly) UINavigationBar *navigationBar;
@property (nonatomic, readonly) WDNavigationController *contentNavigationController;

@property (nonatomic, strong) UIView *supplementaryHeaderView; // Additional header below custom header

@property (nonatomic, strong) UIView *customFooterView; // hides buttons
@property (nonatomic, strong) NSArray *buttons;

- (id)initWithRootViewController:(UIViewController *)rootViewController;

- (void)setNavigationBarStyle:(WDNavigationBarStyle)style;

@end
