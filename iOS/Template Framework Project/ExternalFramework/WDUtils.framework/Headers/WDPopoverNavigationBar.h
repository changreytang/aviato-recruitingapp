//
// Created by Stephen Marquis on 5/30/14.
// Copyright (c) 2014 Workday. All rights reserved.
//

@import UIKit;
#import <Foundation/Foundation.h>

extern const CGFloat kPopoverNavigationBarHeight;
// Subclass that makes the taller nav bar style for popovers
@interface WDPopoverNavigationBar : UINavigationBar

+ (UIImage *)backgroundImage;
+ (UIImage *)shadowImage;

@end
