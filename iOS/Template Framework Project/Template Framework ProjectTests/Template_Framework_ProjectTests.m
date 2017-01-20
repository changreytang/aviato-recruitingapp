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

@interface Template_Framework_ProjectTests : XCTestCase {
@private
    CropViewController *crop_view_controller;
    Applicant *applicant;
    ResumeContactParser *resume_contact_parser;
}
@end

@implementation Template_Framework_ProjectTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testNameParsing {
    NSString* parsed_str = @"Rey Tang tang.changrey@gmail.com (510)283-1574 reytang.me github.com/changreytang linkedin.com/in/changreytang";
    resume_contact_parser = [[ResumeContactParser alloc] init];
    [resume_contact_parser parseContactInfo:parsed_str];
    XCTAssertEqualObjects([[resume_contact_parser emails] componentsJoinedByString:@" "], @"tang.changrey@gmail.com", @"Name Parse One Failed");

    parsed_str = @"tang.changrey@gmail.com";
    resume_contact_parser = [[ResumeContactParser alloc] init];
    [resume_contact_parser parseContactInfo:parsed_str];
    XCTAssertEqualObjects([[resume_contact_parser emails] componentsJoinedByString:@""], @"tang.changrey@gmail.com", @"Name Parse Two Failed");

    parsed_str = @"tang.changrey@gmail.com eric at gmail.com gibberish";
    resume_contact_parser = [[ResumeContactParser alloc] init];
    [resume_contact_parser parseContactInfo:parsed_str];
    XCTAssertEqualObjects([[resume_contact_parser emails] componentsJoinedByString:@""], @"tang.changrey@gmail.com", @"Name Parse Three Failed");

    parsed_str = @"";
    resume_contact_parser = [[ResumeContactParser alloc] init];
    [resume_contact_parser parseContactInfo:parsed_str];
    XCTAssertEqualObjects([[resume_contact_parser emails] componentsJoinedByString:@""], @"", @"Name Parse Four Failed");

    parsed_str = @"tang.changrey@gmail.com erictang@gmail.com";
    resume_contact_parser = [[ResumeContactParser alloc] init];
    [resume_contact_parser parseContactInfo:parsed_str];
    XCTAssertEqualObjects([[resume_contact_parser emails] componentsJoinedByString:@" "], @"tang.changrey@gmail.comerictang@gmail.com", @"Name Parse Five Failed");
}

- (void)testEmailParsing {
    NSString* parsed_str = @"Rey Tang tang.changrey@gmail.com (510)283-1574 reytang.me github.com/changreytang linkedin.com/in/changreytang";
    resume_contact_parser = [[ResumeContactParser alloc] init];
    [resume_contact_parser parseContactInfo:parsed_str];
    XCTAssertEqualObjects([[resume_contact_parser emails] componentsJoinedByString:@""], @"tang.changrey@gmail.com", @"Email Parse One Failed");

    parsed_str = @"tang.changrey@gmail.com";
    resume_contact_parser = [[ResumeContactParser alloc] init];
    [resume_contact_parser parseContactInfo:parsed_str];
    XCTAssertEqualObjects([[resume_contact_parser emails] componentsJoinedByString:@""], @"tang.changrey@gmail.com", @"Email Parse Two Failed");

    parsed_str = @"tang.changrey@gmail.com eric at gmail.com gibberish";
    resume_contact_parser = [[ResumeContactParser alloc] init];
    [resume_contact_parser parseContactInfo:parsed_str];
    XCTAssertEqualObjects([[resume_contact_parser emails] componentsJoinedByString:@""], @"tang.changrey@gmail.com", @"Email Parse Three Failed");

    parsed_str = @"";
    resume_contact_parser = [[ResumeContactParser alloc] init];
    [resume_contact_parser parseContactInfo:parsed_str];
    XCTAssertEqualObjects([[resume_contact_parser emails] componentsJoinedByString:@""], @"", @"Email Parse Four Failed");

    parsed_str = @"tang.changrey@gmail.com erictang@gmail.com";
    resume_contact_parser = [[ResumeContactParser alloc] init];
    [resume_contact_parser parseContactInfo:parsed_str];
    XCTAssertEqualObjects([[resume_contact_parser emails] componentsJoinedByString:@" "], @"tang.changrey@gmail.com erictang@gmail.com", @"Email Parse Five Failed");
}

- (void)testPhoneNumberParsing {
    NSString* parsed_str = @"Rey Tang tang.changrey@gmail.com (510)283-1574 reytang.me github.com/changreytang linkedin.com/in/changreytang";
    resume_contact_parser = [[ResumeContactParser alloc] init];
    [resume_contact_parser parseContactInfo:parsed_str];
    XCTAssertEqualObjects([[resume_contact_parser emails] componentsJoinedByString:@""], @"tang.changrey@gmail.com", @"Phone Number Parse One Failed");

    parsed_str = @"tang.changrey@gmail.com";
    resume_contact_parser = [[ResumeContactParser alloc] init];
    [resume_contact_parser parseContactInfo:parsed_str];
    XCTAssertEqualObjects([[resume_contact_parser emails] componentsJoinedByString:@""], @"tang.changrey@gmail.com", @"Phone Number Parse Two Failed");

    parsed_str = @"tang.changrey@gmail.com eric at gmail.com gibberish";
    resume_contact_parser = [[ResumeContactParser alloc] init];
    [resume_contact_parser parseContactInfo:parsed_str];
    XCTAssertEqualObjects([[resume_contact_parser emails] componentsJoinedByString:@""], @"tang.changrey@gmail.com", @"Phone Number Parse Three Failed");

    parsed_str = @"";
    resume_contact_parser = [[ResumeContactParser alloc] init];
    [resume_contact_parser parseContactInfo:parsed_str];
    XCTAssertEqualObjects([[resume_contact_parser emails] componentsJoinedByString:@""], @"", @"Phone Number Parse Four Failed");

    parsed_str = @"tang.changrey@gmail.com erictang@gmail.com";
    resume_contact_parser = [[ResumeContactParser alloc] init];
    [resume_contact_parser parseContactInfo:parsed_str];
    XCTAssertEqualObjects([[resume_contact_parser emails] componentsJoinedByString:@" "], @"tang.changrey@gmail.com erictang@gmail.com", @"Phone Number Parse Five Failed");
}

- (void)testWebsiteParsing {
    NSString* parsed_str = @"Rey Tang tang.changrey@gmail.com (510)283-1574 reytang.me github.com/changreytang linkedin.com/in/changreytang";
    resume_contact_parser = [[ResumeContactParser alloc] init];
    [resume_contact_parser parseContactInfo:parsed_str];
    XCTAssertEqualObjects([[resume_contact_parser emails] componentsJoinedByString:@""], @"tang.changrey@gmail.com", @"Website Parse One Failed");

    parsed_str = @"tang.changrey@gmail.com";
    resume_contact_parser = [[ResumeContactParser alloc] init];
    [resume_contact_parser parseContactInfo:parsed_str];
    XCTAssertEqualObjects([[resume_contact_parser emails] componentsJoinedByString:@""], @"tang.changrey@gmail.com", @"Website Parse Two Failed");

    parsed_str = @"tang.changrey@gmail.com eric at gmail.com gibberish";
    resume_contact_parser = [[ResumeContactParser alloc] init];
    [resume_contact_parser parseContactInfo:parsed_str];
    XCTAssertEqualObjects([[resume_contact_parser emails] componentsJoinedByString:@""], @"tang.changrey@gmail.com", @"Website Parse Three Failed");

    parsed_str = @"";
    resume_contact_parser = [[ResumeContactParser alloc] init];
    [resume_contact_parser parseContactInfo:parsed_str];
    XCTAssertEqualObjects([[resume_contact_parser emails] componentsJoinedByString:@""], @"", @"Website Parse Four Failed");

    parsed_str = @"tang.changrey@gmail.com erictang@gmail.com";
    resume_contact_parser = [[ResumeContactParser alloc] init];
    [resume_contact_parser parseContactInfo:parsed_str];
    XCTAssertEqualObjects([[resume_contact_parser emails] componentsJoinedByString:@" "], @"tang.changrey@gmail.com erictang@gmail.com", @"Website Parse Five Failed");
}

//[self consoleLog:[numbers componentsJoinedByString:@""]];


- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
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
