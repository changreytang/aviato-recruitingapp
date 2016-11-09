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
#import "TOCropViewController.h"


@interface CropViewController () <TOCropViewControllerDelegate>
@property (weak, nonatomic) IBOutlet SPUserResizableView *cropBoxView;
@property (weak, nonatomic) IBOutlet UIImageView *resumeImageView;
- (IBAction)captureCropBox:(id)sender;
@property (weak, nonatomic) IBOutlet UIImageView *testImageView;


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
    UIGraphicsBeginImageContext(self.cropBoxView.frame.size);

    //NSLog(@"%@",self.cropBoxView.frame);
//    [[self.resumeImageView layer] renderInContext:UIGraphicsGetCurrentContext()];
//    UIImage *screenshot = UIGraphicsGetImageFromCurrentImageContext();
//    [self.testImageView setImage:screenshot];
    TOCropViewController *cropViewController = [[TOCropViewController alloc] initWithImage:self.resumeImage];
    cropViewController.delegate = self;
    [self presentViewController:cropViewController animated:YES completion:nil];
}
- (void)cropViewController:(TOCropViewController *)cropViewController didCropToImage:(UIImage *)image1 withRect:(CGRect)cropRect angle:(NSInteger)angle
{
    [self.resumeImageView setImage:image1];
}
@end
