//
// Created by Stephen Marquis on 3/25/15.
// Copyright (c) 2015 Workday. All rights reserved.
//

@import UIKit;

/*
    Wrapper object around CADisplayLink to let us weakly associate a target, and use an update block instead of selectors
 */
@interface WDDisplayLink : NSObject

// 'target' is held weakly, and passed into the callback
- (instancetype)initWithTarget:(id)target callback:(void (^)(id, WDDisplayLink *))callback;

@property (nonatomic, readonly) CADisplayLink *caDisplayLink; // Use for property access. Do not call invalidate on this object directly. Use 'invalidate' below instead

- (void)start; // Create and schedule the underlying display link into the main thread's run-loop
- (void)invalidate; // Invalidates the underlying display link and target information. Calling 'start' again after invalidate is called is not supported

// NOTE: If you call 'start', the CADisplayLink will stay active until you call invalidate or 'target' is deallocated. Failure to invalidate will lead to a leak.
// We promise not to leak 'target' though

@end
