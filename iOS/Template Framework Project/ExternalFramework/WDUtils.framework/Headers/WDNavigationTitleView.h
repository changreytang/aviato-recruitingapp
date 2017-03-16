//
//  WDNavigationTitleView.h
//  WDUserInterface
//
//  Created by jason.boyle on 10/2/12.
//  Copyright (c) 2012 Workday. All rights reserved.
//

@import UIKit;

@interface WDNavigationTitleView : UIControl

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subtitle;
@property (nonatomic, assign) NSTextAlignment textAlignment;
@property (nonatomic, strong) UIFont *titleFont;
@property (nonatomic, strong) UIColor *titleColor;
@property (nonatomic, assign) CGFloat titleVerticalOffset;
@property (nonatomic, readonly) UIButton *infoButton;

@end
