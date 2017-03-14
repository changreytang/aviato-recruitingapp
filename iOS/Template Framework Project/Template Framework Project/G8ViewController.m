//
//  G8ViewController.m
//  Template Framework Project
//

#import "G8ViewController.h"
#import "CropViewController.h"
#import "Headers/TOCropViewController.h"

@interface G8ViewController () <UINavigationControllerDelegate, UIImagePickerControllerDelegate, TOCropViewControllerDelegate>

@property (nonatomic, strong) NSOperationQueue *operationQueue;

@end

@implementation G8ViewController
UIImage* resumeImage;

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Create a queue to perform recognition operations
    self.operationQueue = [[NSOperationQueue alloc] init];
}

-(void)recognizeImageWithTesseract:(UIImage *)image
{
    // Animate a progress activity indicator
    [self.activityIndicator startAnimating];

    // Create a new `G8RecognitionOperation` to perform the OCR asynchronously
    // It is assumed that there is a .traineddata file for the language pack
    // you want Tesseract to use in the "tessdata" folder in the root of the
    // project AND that the "tessdata" folder is a referenced folder and NOT
    // a symbolic group in your project
    G8RecognitionOperation *operation = [[G8RecognitionOperation alloc] initWithLanguage:@"eng"];

    // Use the original Tesseract engine mode in performing the recognition
    // (see G8Constants.h) for other engine mode options
    operation.tesseract.engineMode = G8OCREngineModeTesseractOnly;
    
    // Let Tesseract automatically segment the page into blocks of text
    // based on its analysis (see G8Constants.h) for other page segmentation
    // mode options
    operation.tesseract.pageSegmentationMode = G8PageSegmentationModeAutoOnly;
    
    // Optionally limit the time Tesseract should spend performing the
    // recognition
    //operation.tesseract.maximumRecognitionTime = 1.0;
    
    // Set the delegate for the recognition to be this class
    // (see `progressImageRecognitionForTesseract` and
    // `shouldCancelImageRecognitionForTesseract` methods below)
    operation.delegate = self;

    // Optionally limit Tesseract's recognition to the following whitelist
    // and blacklist of characters
    //operation.tesseract.charWhitelist = @"01234";
    //operation.tesseract.charBlacklist = @"56789";
    
    // Set the image on which Tesseract should perform recognition
    operation.tesseract.image = image;

    // Optionally limit the region in the image on which Tesseract should
    // perform recognition to a rectangle
    //operation.tesseract.rect = CGRectMake(20, 20, 100, 100);

    // Specify the function block that should be executed when Tesseract
    // finishes performing recognition on the image
    operation.recognitionCompleteBlock = ^(G8Tesseract *tesseract) {
        // Fetch the recognized text
        NSString *recognizedText = tesseract.recognizedText;

        NSLog(@"%@", recognizedText);

        // Remove the animated progress activity indicator
        [self.activityIndicator stopAnimating];

        // Spawn an alert with the recognized text
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"OCR Result"
                                                        message:recognizedText
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
    };
    
    // Finally, add the recognition operation to the queue
    [self.operationQueue addOperation:operation];
}

/**
 *  This function is part of Tesseract's delegate. It will be called
 *  periodically as the recognition happens so you can observe the progress.
 *
 *  @param tesseract The `G8Tesseract` object performing the recognition.
 */
- (void)progressImageRecognitionForTesseract:(G8Tesseract *)tesseract {
    NSLog(@"progress: %lu", (unsigned long)tesseract.progress);
}

/**
 *  This function is part of Tesseract's delegate. It will be called
 *  periodically as the recognition happens so you can cancel the recogntion
 *  prematurely if necessary.
 *
 *  @param tesseract The `G8Tesseract` object performing the recognition.
 *
 *  @return Whether or not to cancel the recognition.
 */
- (BOOL)shouldCancelImageRecognitionForTesseract:(G8Tesseract *)tesseract {
    return NO;  // return YES, if you need to cancel recognition prematurely
}

- (IBAction)openCamera:(id)sender
{
    UIImagePickerController *imgPicker = [UIImagePickerController new];
    imgPicker.delegate = self;

    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
    {
        imgPicker.sourceType = UIImagePickerControllerSourceTypeCamera;
        [self presentViewController:imgPicker animated:YES completion:nil];
    }
}

- (IBAction)openPhotoLibrary:(id)sender {
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary])
    {
        UIImagePickerController *imgPicker = [UIImagePickerController new];
        imgPicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        imgPicker.delegate = self;
        [self presentViewController:imgPicker animated:YES completion:nil];
    }
}


- (IBAction)recognizeSampleImage:(id)sender {
    [self recognizeImageWithTesseract:[UIImage imageNamed:@"image_sample.jpg"]];
}



#pragma mark - UIImagePickerController Delegate

-(void)imagePickerController:(UIImagePickerController *)picker
didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *image = info[UIImagePickerControllerOriginalImage];

    resumeImage = image;
    [picker dismissViewControllerAnimated:YES completion:nil];
    [self performSegueWithIdentifier:@"cropSegue" sender:self];
    //[self recognizeImageWithTesseract:image];
}

// Sends resume image from camera to other CropViewController
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"cropSegue"]){
        CropViewController *controller = (CropViewController *)segue.destinationViewController;
        controller.resumeImage = resumeImage;

    }
}
@end
