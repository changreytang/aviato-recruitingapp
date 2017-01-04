//
//  CropViewController.m
//  Template Framework Project
//
//  Created by Tim Liew on 11/2/16.
//

#import "CropViewController.h"
#import "G8ViewController.h"
#import "ResumeContactParser.h"
#import "Headers/TOCropViewController.h"
#import "ApplicantViewController.h"


@interface CropViewController () <TOCropViewControllerDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *resumeImageView;

@property (nonatomic, strong) NSOperationQueue *operationQueue;
@end

@implementation CropViewController{
NSString *contactInfo;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.resumeImageView setImage:self.resumeImage];
    
    // Create a queue to perform recognition operations
    self.operationQueue = [[NSOperationQueue alloc] init];


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)captureCropBox:(id)sender {
    TOCropViewController *cropViewController = [[TOCropViewController alloc] initWithImage:self.resumeImage];
    cropViewController.delegate = self;
    [self presentViewController:cropViewController animated:YES completion:nil];
}

- (IBAction)backButton:(id)sender {
    [G8Tesseract clearCache];
}



-(NSString*)recognizeImageWithTesseract:(UIImage *)image
{
//    G8RecognitionOperation *operation = [[G8RecognitionOperation alloc] initWithLanguage:@"eng"];
//    operation.tesseract.engineMode = G8OCREngineModeTesseractOnly;
//    operation.tesseract.pageSegmentationMode = G8PageSegmentationModeAutoOnly;
//    operation.delegate = self;
//    operation.tesseract.image = image;
//    __block NSString *recognizedText = nil;
//    operation.recognitionCompleteBlock = ^(G8Tesseract *tesseract) {
//        recognizedText = tesseract.recognizedText;
//    };
//
//    return recognizedText;
    
    
    // Animate a progress activity indicator
    //[self.activityIndicator startAnimating];
    
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
    //operation.tesseract.pageSegmentationMode = G8PageSegmentationModeAutoOnly;
    
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
    
    //__block NSString *recognizedText = @"";
    operation.recognitionCompleteBlock = ^(G8Tesseract *tesseract) {
        // Fetch the recognized text
        NSString *recognizedText = tesseract.recognizedText;
        
        NSLog(@"%@", recognizedText);
        contactInfo = recognizedText;
        
        // Remove the animated progress activity indicator
        //[self.activityIndicator stopAnimating];
        
        // Spawn an alert with the recognized text
    };
    
    // Display the image to be recognized in the view
    //self.imageToRecognize.image = operation.tesseract.thresholdedImage;
    
    // Finally, add the recognition operation to the queue
    [self.operationQueue addOperation:operation];

    //SEND contactInfo TO PARSER THEN TO FORM
    return @"";//recognizedText;
}


- (void)progressImageRecognitionForTesseract:(G8Tesseract *)tesseract {
    NSLog(@"progress: %lu", (unsigned long)tesseract.progress);
}


- (BOOL)shouldCancelImageRecognitionForTesseract:(G8Tesseract *)tesseract {
    return NO;  // return YES, if you need to cancel recognition prematurely

//    [[self.resumeImageView layer] renderInContext:UIGraphicsGetCurrentContext()];
//    UIImage *screenshot = UIGraphicsGetImageFromCurrentImageContext();
//    [self.testImageView setImage:screenshot];
}

- (void)cropViewController:(TOCropViewController *)cropViewController didCropToImage:(UIImage *)image1 withRect:(CGRect) cropRect angle:(NSInteger)angle {
    [self recognizeImageWithTesseract:image1];
    //NSString* c_info = [self recognizeImageWithTesseract:image1];
//    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"OCR Result"
//                                                    message:contactInfo
//                                                   delegate:nil
//                                          cancelButtonTitle:@"OK"
//                                          otherButtonTitles:nil];
//    [alert show];
    ResumeContactParser* parser = [[ResumeContactParser alloc] init];
    [parser parseContactInfo:@"Rey Tang tang.changrey@gmail.com (510)283-1574"];
    //[self.resumeImageView setImage:image1];
}

// Sends resume image from camera to other CropViewController
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"applicantFormSegue"]){
        ApplicantViewController *controller = (ApplicantViewController *)segue.destinationViewController;
        //This should be passing in applicant class which should already be intialized and set through the parser.
        controller.rawInfo = contactInfo;
        
    }
}

@end

