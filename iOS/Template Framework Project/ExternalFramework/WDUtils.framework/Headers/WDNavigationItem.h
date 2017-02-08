//
//  WDNavigationItem.h
//  Duchess
//
//  Created by Jason Boyle on 12/1/11.
//  Copyright (c) 2011 Workday. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WDViewController;
@class WDNavigationItem;
@class WDNavigationTitleView;
@class WDGenericViewController;

typedef NS_OPTIONS(NSUInteger, WDBackingButtonType) {
    WDBackingButtonTypeNone = 0,
    WDBackingButtonTypeBack = 1 << 1,
    WDBackingButtonTypeHome = 1 << 2,
    WDBackingButtonTypeHomeAndBack = WDBackingButtonTypeBack | WDBackingButtonTypeHome,
};

@class WDNavigationItem;

// If a delegate is assigned, then the list item will be shown. If not, a type of 'list' will show no buttons.
@protocol WDNavigationItemDelegate<NSObject>

@end

@interface WDNavigationItem : UINavigationItem

@property (nonatomic, assign) WDBackingButtonType backingButtonType;
@property (nonatomic, weak) id<WDNavigationItemDelegate> delegate;
@property (nonatomic, weak) WDGenericViewController *viewController;

@property (nonatomic, assign) BOOL hidesCustomBackButton;
@property (nonatomic, assign) BOOL viewControllerWantsToHandleBackButton;
@property (nonatomic, assign) BOOL hidesHomeButton;

@property (nonatomic, strong) NSString *subtitle;
@property (nonatomic, readonly) UIButton *infoButton;

@property (nonatomic, assign) NSTextAlignment titleAlignment;
@property (nonatomic, assign) CGFloat titleVerticalOffset;
@property (nonatomic, strong) UIFont *titleFont;
@property (nonatomic, strong) UIColor *titleColor;

- (void)setHidesCustomBackButton:(BOOL)hidesCustomBackButton animated:(BOOL)animated;
- (void)reloadBackingButton;

@end
