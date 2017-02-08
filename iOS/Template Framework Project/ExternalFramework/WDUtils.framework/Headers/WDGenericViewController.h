//
//  WDViewController.h
//  Duchess
//
//  Created by Nick Cooper on 11/2/11.
//  Copyright (c) 2011 Workday. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WDNavigationItem.h"

@class WDStyledModalViewController;

typedef NS_ENUM(NSUInteger, WDNavigationBarStyle) {
    WDNavigationBarStyleNone,
    WDNavigationBarStyleWhite,
    WDNavigationBarStylePopover,
    WDNavigationBarStyleClear
};

typedef NS_ENUM(NSUInteger, WDCancelButtonType) {
    WDCancelButtonTypeNone,
    WDCancelButtonTypeCancel,
    WDCancelButtonTypeClose,
    WDCancelButtonTypeDone
};

typedef NS_ENUM(NSUInteger, WDStyledModalSupportType) {
    WDStyledModalSupportTypeUnsupported,
    WDStyledModalSupportTypeSupported,
    WDStyledModalSupportTypeRequired,
};

@interface WDGenericViewController: UIViewController

@property (nonatomic, readonly, retain) WDNavigationItem *navigationItem;
@property (nonatomic, strong) UIView *backgroundView;
@property (nonatomic, strong) NSDictionary *userInfo;
@property (nonatomic, assign) WDCancelButtonType cancelButtonType;
@property (nonatomic, readonly) WDStyledModalViewController *styledModalViewController;
@property (nonatomic, readonly) BOOL allowsSwipeToHome; // Override in subclasses

// When the user clicks back or close on a conclusion page, this VC will be ignored when searching
// for the previous view controller if transient is true.
@property (nonatomic, assign) BOOL transient;

// default behavior is to dismiss the navigation controller of this view controller
// override for different behavior
- (void)handleCancelButtonPressed:(UIBarButtonItem *)cancelButton;
- (void)handleBackButtonAction;

// For container controllers
- (void)beginObservingNavigationItemsForChild:(WDGenericViewController *)childViewController;
- (void)endObservingNavigationItems;

- (void)addNavigationItemObserversForChild:(WDGenericViewController *)childViewController DEPRECATED_MSG_ATTRIBUTE("Use beginObservingNavigationItemsForChild instead.");
- (void)removeNavigationItemObserversForChild:(WDGenericViewController *)childViewController DEPRECATED_MSG_ATTRIBUTE("Use endObservingNavigationItems instead.");

- (void)updateNavigationItemWithChild:(WDGenericViewController *)viewController;

// Swap self with a new view controller on a nav stack. Handles issues with waiting until navigation animations have completed
- (void)swapInViewController:(WDGenericViewController *)viewController animated:(BOOL)animated;

- (void)updatePopoverCornerRadius;

- (WDNavigationBarStyle)preferredNavigationBarStyle;

- (WDStyledModalSupportType)styledModalSupportType; // Default 'Supported', subclasses can override to customize behavior

/*
 * On iPad, viewDidAppear is not always called after a modal view controller is dismissed.
 * This method is always called after a modal view controller is dismissed.
 * It is called on this and all child view controllers, similar to the behavior of viewDidAppear.
 * It may be called in addition to viewDidAppear (on iPhone, for example).
 */
- (void)viewDidAppearAfterModalDismissal;


// Called when back / home is pressed. doneCallback should be invoked in order to trigger the standard behavior (e.g., popping the navigation stack or showing the home page)
// Subclasses may override this method to delay the navigation action by calling doneCallback at a later time, or not call it at all to prevent navigation
// The default implementation just invokes doneCallback
- (void)interceptNavigationAction:(BOOL)isHomeAction withDoneCallback:(void (^)(void))callback;

// Called by the transaction manager when it wants to pop a transaction with a completion block. The view controller will retain the block until viewDidAppear is called, then it will call it and release it
- (void)setDidAppearCallback:(void (^)())callback;

- (CGFloat)keyboardHeightForFrame:(CGRect)keyboardFrame;

@end
