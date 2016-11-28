//
//  CropViewControllerTests.swift
//  CropViewControllerTests
//
//  Created by Matthew Cheung on 11/28/16.
//  Copyright © 2016 Daniele Galiotto - www.g8production.com. All rights reserved.
//

import XCTest
import UIKit

class CropViewControllerTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testRecognizeImageWithTesseract() {
        // This function asserts that the contact info OCR result is not an empty string
        // So contactInfo must have a value
        let viewController = CropViewController()
        let emptyString = ""
        XCTAssertNotEqual(emptyString, viewController.recognizeImageWithTesseract.contactInfo)
    }
    
    func testDidCropToImage() {
        XCTAssertNotNil(image1)
    }
    
    func 
}
