//
//  Created by Nicholas Cooper on 10/20/15.
//  Copyright © 2015 Workday Inc. All rights reserved.
//

@import UIKit;

#ifndef WDGeometry_h
#define WDGeometry_h

#define CGSizeMax CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX)

typedef NS_ENUM(NSUInteger, WDVerticalAlignment) {
    WDVerticalAlignmentDefault,
    WDVerticalAlignmentTop,
    WDVerticalAlignmentCenter,
    WDVerticalAlignmentBottom
};

typedef NS_ENUM(NSUInteger , WDHorizontalAlignment) {
    WDHorizontalAlignmentDefault,
    WDHorizontalAlignmentLeft,
    WDHorizontalAlignmentCenter,
    WDHorizontalAlignmentRight
};

typedef enum {
    WDDirectionNone,
    WDDirectionLeft,
    WDDirectionRight,
    WDDirectionUp,
    WDDirectionDown
} WDDirection;

// Does a CGRectDivide with 'amount', then subtracts an additional 'padding' from remainder along the same edge before returning
extern void CGRectDivideWithPadding(CGRect rect, CGRect *slice, CGRect *remainder, CGFloat amount, CGFloat padding, CGRectEdge edge);
extern CGRect CGRectCenteredInRectWithSize(CGRect rect, CGSize desiredSize);
extern CGRect CGRectCenteredVerticallyInRectWithSize(CGRect rect, CGSize desiredSize, CGFloat xOrigin);
extern CGRect CGRectCenteredHorizontallyInRectWithSize(CGRect rect, CGSize desiredSize, CGFloat yOrigin);
extern CGPoint CGRectGetCenterPoint(CGRect rect);
extern CGSize CGSizeInset(CGSize size, UIEdgeInsets insets);
extern UIEdgeInsets UIEdgeInsetsNegate(UIEdgeInsets insets);
extern UIEdgeInsets UIEdgeInsetsScale(UIEdgeInsets insets, CGFloat scale);
extern CGSize CGSizeIntegral(CGSize size);
extern CGPoint CGPointIntegral(CGPoint point);
extern CGFloat CGFloatInterpolate(CGFloat startValue, CGFloat endValue, CGFloat percent);
extern CGPoint CGPointInterpolate(CGPoint startPoint, CGPoint endPoint, CGFloat percent);
extern CGFloat CGPointGetDistance(CGPoint startPoint, CGPoint endPoint);
extern CGSize CGSizeInterpolate(CGSize startSize, CGSize endSize, CGFloat percent);
extern CGRect CGRectInterpolate(CGRect startRect, CGRect endRect, CGFloat percent);
extern CGRect CGRectMakeIntegral(CGFloat x, CGFloat y, CGFloat width, CGFloat height);
extern CGSize CGSizeAspectFitToSize(CGSize size, CGSize boundSize);
extern CGSize CGSizeAspectFilledToSize(CGSize size, CGSize boundSize);

extern NSValue* CGSizeValue(CGSize size);
extern NSValue* CGRectValue(CGRect rect);

@interface WDGeometry : NSObject

+ (NSArray *)rectsVerticallyCenteredInRect:(CGRect)rect desiredSizes:(NSArray *)sizes paddings:(NSArray *)paddings horizontalAlignment:(WDHorizontalAlignment)alignment alignToX:(CGFloat)xOffset;
+ (NSArray *)rectsHorizontallyCenteredInRect:(CGRect)rect desiredSizes:(NSArray *)sizes paddings:(NSArray *)paddings verticalAlignment:(WDVerticalAlignment)alignment alignToY:(CGFloat)yOffset;
+ (CGRect)rectThatFitsInRect:(CGRect)maxRect scalingSize:(CGSize)size verticalAlignment:(WDVerticalAlignment)verticalAlignment horizontalAlignment:(WDHorizontalAlignment)horizontalAlignment;
+ (CGRect)rectThatFitsInRect:(CGRect)maxRect scalingMaxSize:(CGSize)size verticalAlignment:(WDVerticalAlignment)verticalAlignment horizontalAlignment:(WDHorizontalAlignment)horizontalAlignment;

@end

#endif /* WDGeometry_h */
