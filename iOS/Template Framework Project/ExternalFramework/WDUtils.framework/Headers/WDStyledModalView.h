//
// Created by Stephen Marquis on 4/29/14.
// Copyright (c) 2014 Workday. All rights reserved.
//

@import UIKit;
#import <Foundation/Foundation.h>


@interface WDStyledModalView : UIView

@property (nonatomic, assign) CGFloat customHeaderViewInset;

@property (nonatomic, strong) UIView *customHeaderView;
@property (nonatomic, strong) UIView *supplementaryHeaderView;

@property (nonatomic, readonly) UILabel *titleLabel;

@property (nonatomic, strong) UIView *contentView;

// Exposed for edit mode styling.
@property (nonatomic, strong) UIView *topBackgroundView;

@property (nonatomic, strong) NSArray *buttons;
@property (nonatomic, strong) UIView *customFooterView; // replaces buttons

@end
