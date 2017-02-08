//
//  WDNavigationController
//  
//
//  Created by Nick Cooper on 8/28/12.
//  Copyright (c) 2011 Workday. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WDGenericViewController.h"

@interface WDNavigationController : UINavigationController

- (id)initWithRootViewController:(UIViewController *)viewController forPopover:(BOOL)forPopover;
- (void)updateAppearanceForNavigationBarWithStyle:(WDNavigationBarStyle)style animated:(BOOL)animated;

@end
