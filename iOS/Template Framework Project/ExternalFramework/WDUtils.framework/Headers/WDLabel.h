//
// Created by Nicholas Cooper on 8/15/14.
// Copyright (c) 2014 Workday. All rights reserved.
//

@import UIKit;

typedef NS_ENUM(NSUInteger, WDLabelLineSpacingContext) {
    WDLabelLineSpacingStandardContext,
    WDLabelLineSpacingInboxHeaderContext
};

typedef NS_ENUM(NSUInteger, WDLabelVerticalTextAlignment) {
    WDLabelDefaultAlignment,
    WDLabelTopAlignment,
    WDLabelBottomAlignment
};

@interface WDLabel : UILabel

+ (CGFloat)lineSpacingForFont:(UIFont *)font;

// Assumes multiple lines and standard context
+ (CGSize)labelSizeWithString:(NSString *)string forWidth:(CGFloat)width attributes:(NSDictionary *)attributes;

@property (nonatomic, assign) WDLabelLineSpacingContext lineSpacingContext;
@property (nonatomic, assign) WDLabelVerticalTextAlignment verticalAlignment;
@property (nonatomic, assign) UIEdgeInsets edgeInsets;
@property (nonatomic, assign) BOOL underline;
@end
