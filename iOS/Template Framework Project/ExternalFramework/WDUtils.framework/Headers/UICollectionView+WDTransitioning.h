//
//  UICollectionView+WDTransitioning.h
//  WDUserInterface
//
//  Created by Jason Boyle on 11/24/14.
//  Copyright (c) 2014 Workday. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UICollectionView (WDTransitioning)

- (UICollectionViewTransitionLayout *)transitionToCollectionViewLayout:(UICollectionViewLayout *)layout
                                                              duration:(NSTimeInterval)duration
                                                            completion:(UICollectionViewLayoutInteractiveTransitionCompletion)completion;

- (void)finishTimedTransition;
- (void)cancelTimedTransition;

@end
