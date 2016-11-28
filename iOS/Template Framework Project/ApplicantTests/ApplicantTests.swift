//
//  ApplicantTests.swift
//  ApplicantTests
//
//  Created by Matthew Cheung on 11/28/16.
//  Copyright © 2016 Daniele Galiotto - www.g8production.com. All rights reserved.
//

import XCTest

class ApplicantTests: XCTestCase {
    
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
    
    func testGetName() {
        let emptyString = ""
        XCTAssertNotEqual(emptyString, Applicant.name)
    }
    
    func testGetPhoneNumber() {
        let emptyString = ""
        XCTAssertNotEqual(emptyString, Applicant.phoneNum)
    }
    
    func testGetEmail() {
        let emptyString = ""
        XCTAssertNotEqual(emptyString, Applicant.email)
    }
    
    func testGetAddress() {
        let emptyString = ""
        XCTAssertNotEqual(emptyString, Applicant.address)
    }
    
}
