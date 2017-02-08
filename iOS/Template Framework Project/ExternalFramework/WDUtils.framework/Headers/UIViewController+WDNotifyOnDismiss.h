//
// Created by Jason Boyle on 6/30/15.
// Copyright (c) 2015 Workday. All rights reserved.
//

@import UIKit;

@interface UIViewController (WDNotifyOnDismiss)

- (void (^)(void))replacementCompletionBlockForDismissViewController:(void (^)(void))completion;

@end
