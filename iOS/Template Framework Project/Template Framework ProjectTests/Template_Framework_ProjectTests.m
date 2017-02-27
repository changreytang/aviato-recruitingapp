//
//  Template_Framework_ProjectTests.m
//  Template Framework ProjectTests
//
//  Created by Chang Rey Tang on 1/18/17.
//  Copyright © 2017 Daniele Galiotto - www.g8production.com. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "Applicant.h"
#import "CropViewController.h"
#import "ResumeContactParser.h"
#import <UIKit/UIKit.h>
#import <TesseractOCR/TesseractOCR.h>
#import <AssetsLibrary/AssetsLibrary.h>

@interface Template_Framework_ProjectTests : XCTestCase {
@private
    CropViewController *crop_view_controller;
    Applicant *applicant;
    ResumeContactParser *resume_contact_parser;
    NSOperationQueue *operationQueue;
    //G8RecognitionOperation *operation
}
@end

@implementation Template_Framework_ProjectTests

- (void)setUp {
    [super setUp];
    operationQueue = [[NSOperationQueue alloc] init];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testOCRName {
    Applicant *app = [[Applicant alloc] init];

    [app setFName:@"John"];
    [app setLName:@"Lee"];
    XCTAssertEqualObjects([self recognizeImageWithTesseract:[UIImage imageNamed:@"resume1.jpg"] withApplicant:app], @"TRUE", @"Resume 1 OCR Failed");
    
    [app setFName:@"Nether"];
    [app setLName:@"Paige"];
    XCTAssertEqualObjects([self recognizeImageWithTesseract:[UIImage imageNamed:@"resume2.png"] withApplicant:app], @"TRUE", @"Resume 2 OCR Failed");
    
    [app setFName:@"Evan"];
    [app setLName:@"Chen"];
    XCTAssertEqualObjects([self recognizeImageWithTesseract:[UIImage imageNamed:@"resume3.jpg"] withApplicant:app], @"TRUE", @"Resume 3 OCR Failed");
    
    [app setFName:@"Evans"];
    [app setLName:@"Ding"];
    XCTAssertEqualObjects([self recognizeImageWithTesseract:[UIImage imageNamed:@"resume4.png"] withApplicant:app], @"TRUE", @"Resume 4 OCR Failed");
    
    [app setFName:@"Han"];
    [app setLName:@"Lee"];
    XCTAssertEqualObjects([self recognizeImageWithTesseract:[UIImage imageNamed:@"resume5.jpg"] withApplicant:app], @"TRUE", @"Resume 5 OCR Failed");
    
    [app setFName:@"John"];
    [app setLName:@"Lee"];
    XCTAssertEqualObjects([self recognizeImageWithTesseract:[UIImage imageNamed:@"resume1.jpg"] withApplicant:app], @"TRUE", @"Resume 6 OCR Failed");
    
    [app setFName:@"Nether"];
    [app setLName:@"Paige"];
    XCTAssertEqualObjects([self recognizeImageWithTesseract:[UIImage imageNamed:@"resume2.png"] withApplicant:app], @"TRUE", @"Resume 7 OCR Failed");
    
    [app setFName:@"Evan"];
    [app setLName:@"Chen"];
    XCTAssertEqualObjects([self recognizeImageWithTesseract:[UIImage imageNamed:@"resume3.jpg"] withApplicant:app], @"TRUE", @"Resume 8 OCR Failed");
    
    [app setFName:@"Evans"];
    [app setLName:@"Ding"];
    XCTAssertEqualObjects([self recognizeImageWithTesseract:[UIImage imageNamed:@"resume4.png"] withApplicant:app], @"TRUE", @"Resume 9 OCR Failed");
    
    [app setFName:@"Han"];
    [app setLName:@"Lee"];
    XCTAssertEqualObjects([self recognizeImageWithTesseract:[UIImage imageNamed:@"resume5.jpg"] withApplicant:app], @"TRUE", @"Resume 10 OCR Failed");
    
    [app setFName:@"John"];
    [app setLName:@"Lee"];
    XCTAssertEqualObjects([self recognizeImageWithTesseract:[UIImage imageNamed:@"resume1.jpg"] withApplicant:app], @"TRUE", @"Resume 11 OCR Failed");
    
    [app setFName:@"Nether"];
    [app setLName:@"Paige"];
    XCTAssertEqualObjects([self recognizeImageWithTesseract:[UIImage imageNamed:@"resume2.png"] withApplicant:app], @"TRUE", @"Resume 12 OCR Failed");
    
    [app setFName:@"Evan"];
    [app setLName:@"Chen"];
    XCTAssertEqualObjects([self recognizeImageWithTesseract:[UIImage imageNamed:@"resume3.jpg"] withApplicant:app], @"TRUE", @"Resume 13 OCR Failed");
    
    [app setFName:@"Evans"];
    [app setLName:@"Ding"];
    XCTAssertEqualObjects([self recognizeImageWithTesseract:[UIImage imageNamed:@"resume4.png"] withApplicant:app], @"TRUE", @"Resume 14 OCR Failed");
    
    [app setFName:@"Han"];
    [app setLName:@"Lee"];
    XCTAssertEqualObjects([self recognizeImageWithTesseract:[UIImage imageNamed:@"resume5.jpg"] withApplicant:app], @"TRUE", @"Resume 15 OCR Failed");
    
    [app setFName:@"John"];
    [app setLName:@"Lee"];
    XCTAssertEqualObjects([self recognizeImageWithTesseract:[UIImage imageNamed:@"resume1.jpg"] withApplicant:app], @"TRUE", @"Resume 16 OCR Failed");
    
    [app setFName:@"Nether"];
    [app setLName:@"Paige"];
    XCTAssertEqualObjects([self recognizeImageWithTesseract:[UIImage imageNamed:@"resume2.png"] withApplicant:app], @"TRUE", @"Resume 17 OCR Failed");
    
    [app setFName:@"Evan"];
    [app setLName:@"Chen"];
    XCTAssertEqualObjects([self recognizeImageWithTesseract:[UIImage imageNamed:@"resume3.jpg"] withApplicant:app], @"TRUE", @"Resume 18 OCR Failed");
    
    [app setFName:@"Evans"];
    [app setLName:@"Ding"];
    XCTAssertEqualObjects([self recognizeImageWithTesseract:[UIImage imageNamed:@"resume4.png"] withApplicant:app], @"TRUE", @"Resume 19 OCR Failed");
    
    [app setFName:@"Han"];
    [app setLName:@"Lee"];
    XCTAssertEqualObjects([self recognizeImageWithTesseract:[UIImage imageNamed:@"resume5.jpg"] withApplicant:app], @"TRUE", @"Resume 20 OCR Failed");
    
    [app setFName:@"John"];
    [app setLName:@"Lee"];
    XCTAssertEqualObjects([self recognizeImageWithTesseract:[UIImage imageNamed:@"resume1.jpg"] withApplicant:app], @"TRUE", @"Resume 1 OCR Failed");
    
    [app setFName:@"Nether"];
    [app setLName:@"Paige"];
    XCTAssertEqualObjects([self recognizeImageWithTesseract:[UIImage imageNamed:@"resume2.png"] withApplicant:app], @"TRUE", @"Resume 2 OCR Failed");
    
    [app setFName:@"Evan"];
    [app setLName:@"Chen"];
    XCTAssertEqualObjects([self recognizeImageWithTesseract:[UIImage imageNamed:@"resume3.jpg"] withApplicant:app], @"TRUE", @"Resume 3 OCR Failed");
    
    [app setFName:@"Evans"];
    [app setLName:@"Ding"];
    XCTAssertEqualObjects([self recognizeImageWithTesseract:[UIImage imageNamed:@"resume4.png"] withApplicant:app], @"TRUE", @"Resume 4 OCR Failed");
    
    [app setFName:@"Han"];
    [app setLName:@"Lee"];
    XCTAssertEqualObjects([self recognizeImageWithTesseract:[UIImage imageNamed:@"resume5.jpg"] withApplicant:app], @"TRUE", @"Resume 5 OCR Failed");
    
    [app setFName:@"Jon"];
    [app setLName:@"Lee"];
    XCTAssertEqualObjects([self recognizeImageWithTesseract:[UIImage imageNamed:@"resume1.jpg"] withApplicant:app], @"TRUE", @"Resume 6 OCR Failed");
    
    [app setFName:@"Nether"];
    [app setLName:@"Paige"];
    XCTAssertEqualObjects([self recognizeImageWithTesseract:[UIImage imageNamed:@"resume2.png"] withApplicant:app], @"TRUE", @"Resume 7 OCR Failed");
    
    [app setFName:@"Evan"];
    [app setLName:@"Chen"];
    XCTAssertEqualObjects([self recognizeImageWithTesseract:[UIImage imageNamed:@"resume3.jpg"] withApplicant:app], @"TRUE", @"Resume 8 OCR Failed");
    
    [app setFName:@"Evans"];
    [app setLName:@"Ding"];
    XCTAssertEqualObjects([self recognizeImageWithTesseract:[UIImage imageNamed:@"resume4.png"] withApplicant:app], @"TRUE", @"Resume 9 OCR Failed");
    
    [app setFName:@"an"];
    [app setLName:@"Lee"];
    XCTAssertEqualObjects([self recognizeImageWithTesseract:[UIImage imageNamed:@"resume5.jpg"] withApplicant:app], @"TRUE", @"Resume 10 OCR Failed");
    
    [app setFName:@"John"];
    [app setLName:@"Lee"];
    XCTAssertEqualObjects([self recognizeImageWithTesseract:[UIImage imageNamed:@"resume1.jpg"] withApplicant:app], @"TRUE", @"Resume 11 OCR Failed");
    
    [app setFName:@"Nether"];
    [app setLName:@"Paige"];
    XCTAssertEqualObjects([self recognizeImageWithTesseract:[UIImage imageNamed:@"resume2.png"] withApplicant:app], @"TRUE", @"Resume 12 OCR Failed");
    
    [app setFName:@"Evan"];
    [app setLName:@"Chen"];
    XCTAssertEqualObjects([self recognizeImageWithTesseract:[UIImage imageNamed:@"resume3.jpg"] withApplicant:app], @"TRUE", @"Resume 13 OCR Failed");
    
    [app setFName:@"Evans"];
    [app setLName:@"Ding"];
    XCTAssertEqualObjects([self recognizeImageWithTesseract:[UIImage imageNamed:@"resume4.png"] withApplicant:app], @"TRUE", @"Resume 14 OCR Failed");
    
    [app setFName:@"Han"];
    [app setLName:@"Le"];
    XCTAssertEqualObjects([self recognizeImageWithTesseract:[UIImage imageNamed:@"resume5.jpg"] withApplicant:app], @"TRUE", @"Resume 15 OCR Failed");
    
    [app setFName:@"John"];
    [app setLName:@"Lee"];
    XCTAssertEqualObjects([self recognizeImageWithTesseract:[UIImage imageNamed:@"resume1.jpg"] withApplicant:app], @"TRUE", @"Resume 16 OCR Failed");
    
    [app setFName:@"Nether"];
    [app setLName:@"Paige"];
    XCTAssertEqualObjects([self recognizeImageWithTesseract:[UIImage imageNamed:@"resume2.png"] withApplicant:app], @"TRUE", @"Resume 17 OCR Failed");
    
    [app setFName:@"Evan"];
    [app setLName:@"Chen"];
    XCTAssertEqualObjects([self recognizeImageWithTesseract:[UIImage imageNamed:@"resume3.jpg"] withApplicant:app], @"TRUE", @"Resume 18 OCR Failed");
    
    [app setFName:@"Evans"];
    [app setLName:@"Ding"];
    XCTAssertEqualObjects([self recognizeImageWithTesseract:[UIImage imageNamed:@"resume4.png"] withApplicant:app], @"TRUE", @"Resume 19 OCR Failed");
    
    [app setFName:@"Han"];
    [app setLName:@"Lee"];
    XCTAssertEqualObjects([self recognizeImageWithTesseract:[UIImage imageNamed:@"resume5.jpg"] withApplicant:app], @"TRUE", @"Resume 20 OCR Failed");
}

//[self consoleLog:[numbers componentsJoinedByString:@""]];


- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

- (NSString*)recognizeImageWithTesseract:(UIImage *)image withApplicant:(Applicant*)app
{
    G8Tesseract *tesseract = [[G8Tesseract alloc] initWithLanguage:@"eng"];
    ResumeContactParser* parser = [[ResumeContactParser alloc] init];
    tesseract.engineMode = G8OCREngineModeTesseractOnly;
    tesseract.image = image;
    //tesseract.charWhitelist = @"@123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ. ";
    [tesseract recognize];
    
    Applicant *rec_app = [parser parseContactInfo:[tesseract recognizedText]];
    NSLog(@"%@", [tesseract recognizedText]);
    
    if([[rec_app getFName] isEqualToString:[app getFName]] && [[rec_app getLName] isEqualToString:[app getLName]]) {
        NSLog(@"%@", [app getFName]);
        return @"TRUE";
    }
    
    return @"FALSE";
    
}



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

@end
