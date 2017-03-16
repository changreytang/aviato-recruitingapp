//
//  Created by Scott Kovatch on 5/1/14.
//  Copyright (c) 2014 Workday. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WDStyleDefault.h"


@interface WDStyleDefault (Testing)

- (UIFont *)scaledFontForFontNamed:(NSString *)fontName size:(CGFloat)fontSize forCategory:(NSString *)contentSize;

@end
