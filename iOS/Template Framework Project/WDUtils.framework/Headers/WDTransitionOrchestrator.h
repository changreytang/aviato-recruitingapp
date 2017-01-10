//
// Created by Jason Boyle on 4/29/14.
// Copyright (c) 2014 Workday. All rights reserved.
//

@import UIKit;

@class WDTransition;

@interface WDTransitionOrchestrator : NSObject
@property (nonatomic, copy) void(^completionBlock)(void);
@property (nonatomic, assign) double transitionProgress;
- (void)applyCurrentTransitionProgress;

- (void)addTransition:(WDTransition *)transition toObject:(id)object;
- (void)addTransitions:(NSArray *)transitions toObject:(id)object;
- (void)removeAllTransitions;
- (void)startTransitionWithDuration:(NSTimeInterval)duration completion:(void (^)(void))completion;
- (void)startTransitionWithDuration:(NSTimeInterval)duration withTimeDelay:(NSTimeInterval)delay completion:(void (^)(void))completion;
- (void)stopTransition;

@end
