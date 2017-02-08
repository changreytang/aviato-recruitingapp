//
// Created by Quynh Nguyen on 3/23/15.
// Copyright (c) 2015 Workday. All rights reserved.
//

@import UIKit;

typedef NS_ENUM(NSUInteger , WDTimingFunctionType) {
    WDTimingFunctionBackOut,
    WDTimingFunctionBackIn,
    WDTimingFunctionBackInOut,

    WDTimingFunctionBounceOut,
    WDTimingFunctionBounceIn,
    WDTimingFunctionBounceInOut,

    WDTimingFunctionCircOut,
    WDTimingFunctionCirIn,
    WDTimingFunctionCirInOut,

    WDTimingFunctionCubicOut,
    WDTimingFunctionCubicIn,
    WDTimingFunctionCubicInOut,

    WDTimingFunctionElasticOut,
    WDTimingFunctionElasticIn,
    WDTimingFunctionElasticInout,

    WDTimingFunctionQuintOut,
    WDTimingFunctionQuintIn,
    WDTimingFunctionQuintInOut,

    WDTimingFunctionSineOut,
    WDTimingFunctionSineIn,
    WDTimingFunctionSineInOut,

    WDTimingFunctionLinear,
    WDTimingFunctionEaseIn,
    WDTimingFunctionEaseOut,
    WDTimingFunctionEaseInOut,

    WDTimingFunctionCustom,

};

NS_ASSUME_NONNULL_BEGIN

typedef CGFloat (^TimingFunctionValueInterpolator)(CGFloat currentTime, CGFloat fromValue, CGFloat toValue, CGFloat duration);

@interface WDTimingFunction : NSObject

- (instancetype)initWithType:(WDTimingFunctionType)type;
+ (instancetype)timingFunctionWithType:(WDTimingFunctionType)type;

- (NSValue *)interpolateValueWithCurrentTime:(CGFloat)currentTime fromValue:(id)fromValue toValue:(id)toValue duration:(CGFloat)duration;

@property (nonatomic, copy) TimingFunctionValueInterpolator customFunctionValueInterpolator;


@end

NS_ASSUME_NONNULL_END
