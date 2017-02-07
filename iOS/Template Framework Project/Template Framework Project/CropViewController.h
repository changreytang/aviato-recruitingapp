//
//  CropViewController.h
//  Template Framework Project
//
//  Created by Tim Liew on 11/2/16.
//

#import <UIKit/UIKit.h>
#import <TesseractOCR/TesseractOCR.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import "Applicant.h"

@class G8ViewController;

@interface CropViewController : UIViewController <G8TesseractDelegate, UIGestureRecognizerDelegate>

@property (nonatomic, strong) UIImage* resumeImage;
@property (nonatomic, strong) Applicant* candidate;

- (void) performSegue;
@end
