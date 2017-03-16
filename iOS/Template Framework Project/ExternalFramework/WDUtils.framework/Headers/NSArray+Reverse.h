//
//  NSArray+Reverse.h
//  Workday_iPad
//
//  Created by John on 5/19/11.
//  Copyright 2011 Workday. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSArray (NSArray_Reverse)

- (NSArray *)reversedArray;

@end

@interface NSMutableArray (NSArray_Reverse)

- (void)reverse;

@end
