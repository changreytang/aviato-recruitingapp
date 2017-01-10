//
//  WDTransition.h
//  WDUserInterface
//
//  Created by Jason Boyle on 12/15/14.
//  Copyright (c) 2014 Workday. All rights reserved.
//

@import UIKit;

NS_ASSUME_NONNULL_BEGIN

typedef id _Nonnull (^ValueTransformer)(id _Nonnull);

@interface WDTransition : NSObject

@property (nonatomic, copy) NSString *keyPath;

// The value transformer transforms interpolated values from one type to another before a property is set.
// For example, a transition could interpolate over CGFloat values which are converted to a CGAffineTransform property
@property (nonatomic, copy) ValueTransformer valueTransformer;

+ (instancetype)transitionWithKeyPath:(NSString *)keyPath;

- (void)applyTransitionWithProgress:(double)progress toObject:(id)object;

@end

#pragma mark -

@interface WDConstantTransition : WDTransition

@property (nonatomic, strong) id value;

@end

#pragma mark -

@interface WDKeyframeTransition : WDTransition

@property (nonatomic, strong) NSArray *values;
@property (nonatomic, strong) NSArray *keyTimes;
@property (nonatomic, assign) double totalDuration; // Duration upon which 'keyTimes' is based. Default value is 1
@property (nonatomic, strong) NSArray *timingFunctions; // The timingFunctions.count should equal to keyTimes.count-1; otherwise, it will reuse the last timingFunction
@property (nonatomic, assign) BOOL shouldInterpolate;

@end

#pragma mark -

@interface WDKeyframeTransition (Reverse)

- (void)reverseValues;
- (void)reverseKeyTimes;
- (void)reverseKeyTimesAndValues;

@end

NS_ASSUME_NONNULL_END
