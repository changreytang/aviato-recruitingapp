//
//  G8ViewController.h
//  Template Framework Project
//

#import <UIKit/UIKit.h>
#import <TesseractOCR/TesseractOCR.h>
@class CropViewController;

@interface G8ViewController : UIViewController <G8TesseractDelegate,
                                                UIImagePickerControllerDelegate,
                                                UINavigationControllerDelegate>

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

- (IBAction)openCamera:(id)sender;
- (IBAction)recognizeSampleImage:(id)sender;

@end
