//
//  CropViewController.h
//  Template Framework Project
//
//  Created by Tim Liew on 11/2/16.
//  Copyright © 2016 Daniele Galiotto - www.g8production.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SPUserResizableView.h"
#import <TesseractOCR/TesseractOCR.h>

@class G8ViewController;

@interface CropViewController : UIViewController <G8TesseractDelegate, UIGestureRecognizerDelegate, SPUserResizableViewDelegate>

@property (nonatomic) UIImage* resumeImage;
@end
