//
//  Created by Nicholas Cooper on 10/29/15.
//  Copyright © 2015 Workday Inc. All rights reserved.
//

@import UIKit;

@interface WDImageCreator : NSObject
+ (UIImage *)imageOfSize:(CGSize)size name:(NSString *)name usingBlock:(void (^)(CGContextRef context, CGRect rect))block;
+ (UIImage *)grayScaleImageFromImage:(UIImage *)image;
+ (UIImage *)xIconOfSize:(CGSize)size color:(UIColor *)color;
+ (UIImage *)xIconWithCircularBorderOfLength:(CGFloat)length color:(UIColor *)color;

+ (UIImage *)newImageFromView:(UIView *)view;
+ (UIImage *)newImageFromView:(UIView *)view opaque:(BOOL)opaque scale:(CGFloat)scale;
+ (UIImage *)newImageFromView:(UIView *)view opaque:(BOOL)opaque scale:(CGFloat)scale afterScreenUpdates:(BOOL)afterUpdates;
@end
