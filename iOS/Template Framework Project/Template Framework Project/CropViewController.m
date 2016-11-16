//
//  CropViewController.m
//  Template Framework Project
//
//  Created by Tim Liew on 11/2/16.
//  Copyright © 2016 Daniele Galiotto - www.g8production.com. All rights reserved.
//

#import "CropViewController.h"
#import "G8ViewController.h"
#import "SPUserResizableView.h"
#import "ResumeContactParser.h"
#import "TOCropViewController.h"


@interface CropViewController () <TOCropViewControllerDelegate>
@property (weak, nonatomic) IBOutlet SPUserResizableView *cropBoxView;
@property (weak, nonatomic) IBOutlet UIImageView *resumeImageView;
@property (weak, nonatomic) IBOutlet UIImageView *testImageView;

- (IBAction)captureCropBox:(id)sender;


@end

@implementation CropViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.resumeImageView setImage:self.resumeImage];


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


-(NSString*)recognizeImageWithTesseract:(UIImage *)image
{
    G8RecognitionOperation *operation = [[G8RecognitionOperation alloc] initWithLanguage:@"eng"];
    operation.tesseract.engineMode = G8OCREngineModeTesseractOnly;
    operation.tesseract.pageSegmentationMode = G8PageSegmentationModeAutoOnly;
    operation.delegate = self;
    operation.tesseract.image = image;
    __block NSString *recognizedText = nil;
    operation.recognitionCompleteBlock = ^(G8Tesseract *tesseract) {
        recognizedText = tesseract.recognizedText;
    };

    return recognizedText;
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
    NSString* c_info = [self recognizeImageWithTesseract:image1];
    ResumeContactParser* parser = [[ResumeContactParser alloc] init];
    [parser parseContactInfo:c_info];
    //[self.resumeImageView setImage:image1];
}

@end

