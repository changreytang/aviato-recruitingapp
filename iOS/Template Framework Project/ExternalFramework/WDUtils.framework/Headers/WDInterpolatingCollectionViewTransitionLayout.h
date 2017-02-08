//
// Created by Stephen Marquis on 1/7/15.
// Copyright (c) 2015 Workday. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WDInterpolatingCollectionViewTransitionLayout : UICollectionViewTransitionLayout

@property (nonatomic, copy) void (^transitionsBlock)(WDInterpolatingCollectionViewTransitionLayout *);
@property (nonatomic, assign) BOOL useEndLayout; // Used to trigger the end state early

- (void)setTransitions:(NSArray *)transitions forItemAtIndexPath:(NSIndexPath *)indexPath;
- (void)setTransitions:(NSArray *)transitions forSupplementaryViewAtIndexPath:(NSIndexPath *)indexPath ofKind:(NSString *)kind;
- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect;

@end
