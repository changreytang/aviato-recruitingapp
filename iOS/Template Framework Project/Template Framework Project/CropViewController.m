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
#import "HTTPRequester.h"

@interface CropViewController () <TOCropViewControllerDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *resumeImageView;

@property (nonatomic, strong) NSOperationQueue *operationQueue;
@end

@implementation CropViewController{
    NSString *contactInfo;
    NSString *currentID;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.resumeImageView setImage:self.resumeImage];
    
    // Create a queue to perform recognition operations
    self.operationQueue = [[NSOperationQueue alloc] init];
    
    currentID = [[NSProcessInfo processInfo] globallyUniqueString];
    NSLog(@"randID is %@", currentID);
    //[[[HTTPRequester alloc] init] sendHttpPostPicture:self.resumeImage withID: currentID];
    
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
    //self.resumeImageView.image = image;
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
        //contactInfo = recognizedText;
        
        ResumeContactParser* parser = [[ResumeContactParser alloc] init];
        parser.viewController=(CropViewController*)self.navigationController.visibleViewController;//Save view controller
        self.candidate = [parser parseContactInfo:recognizedText];
        
        [self performSegueWithIdentifier:@"applicantVCSegue" sender:self];
        // Remove the animated progress activity indicator
        //[self.activityIndicator stopAnimating];
        
        // Spawn an alert with the recognized text
    };
    
    // Display the image to be recognized in the view
    self.resumeImageView.image = operation.tesseract.thresholdedImage;
    
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
    //UIImage *image = [UIImage imageNamed:@"Image.jpg"];
    UIImageWriteToSavedPhotosAlbum(image1, nil, nil, nil);
    //self.resumeImageView.image = image1;
    //int i = 100000000;
    //while(i > -10000000) i--;
    double delayInSeconds = 0.5;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        [self croppedImageSaved];
    });
    
    
    //[self recognizeImageWithTesseract:image1];
    //NSString* c_info = [self recognizeImageWithTesseract:image1];
    //NSString* test = @"Rey Tang tang.changrey@gmail.com (510)283-1574 reytang.me github.com/changreytang linkedin.com/in/changreytang";
    //    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"OCR Result"
    //                                                    message:contactInfo
    //                                                   delegate:nil
    //                                          cancelButtonTitle:@"OK"
    //                                          otherButtonTitles:nil];
    //    [alert show];
    //    ResumeContactParser* parser = [[ResumeContactParser alloc] init];
    //    [parser parseContactInfo:test];
    //[self.resumeImageView setImage:image1];
}

- (void)croppedImageSaved {
    ALAssetsLibrary *assetsLibrary = [[ALAssetsLibrary alloc] init];
    [assetsLibrary enumerateGroupsWithTypes:ALAssetsGroupSavedPhotos
                                 usingBlock:^(ALAssetsGroup *group, BOOL *stop) {
                                     if (nil != group) {
                                         // be sure to filter the group so you only get photos
                                         [group setAssetsFilter:[ALAssetsFilter allPhotos]];
                                         
                                         if (group.numberOfAssets > 0) {
                                             [group enumerateAssetsAtIndexes:[NSIndexSet indexSetWithIndex:group.numberOfAssets - 1]
                                                                     options:0
                                                                  usingBlock:^(ALAsset *result, NSUInteger index, BOOL *stop) {
                                                                      if (nil != result) {
                                                                          ALAssetRepresentation *repr = [result defaultRepresentation];
                                                                          // this is the most recent saved photo
                                                                          UIImage *img = [UIImage imageWithCGImage:[repr fullResolutionImage]];
                                                                          [[[HTTPRequester alloc] init] sendHttpPostPicture:self.resumeImage withID: currentID];

                                                                          [self recognizeImageWithTesseract:img];
                                                                          // we only need the first (most recent) photo -- stop the enumeration
                                                                          *stop = YES;
                                                                      }
                                                                  }];
                                         }
                                     }
                                     
                                     *stop = NO;
                                 } failureBlock:^(NSError *error) {
                                     NSLog(@"error: %@", error);
                                 }];
    //[self recognizeImageWithTesseract:image];
}

- (IBAction)newApplicantBtn:(id)sender {
    [self performSegueWithIdentifier:@"applicantVCSegue" sender:self];
}


// Sends resume image from camera to other CropViewController
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"applicantVCSegue"]){
        ApplicantViewController *controller = (ApplicantViewController *)segue.destinationViewController;
        //This should be passing in applicant class which should already be intialized and set through the parser.
        controller.rawInfo = contactInfo;
        controller.applicantInstance = self.candidate;
        NSLog(@"randID is %@ sending to applicant VC", currentID);
        controller.applicantID = currentID;
    }
}

@end

