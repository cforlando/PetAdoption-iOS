//
//  PetAdoptionTransportKitTests.swift
//  PetAdoptionTransportKitTests
//
//  Created by Tom Marks on 21/08/2016.
//  Copyright © 2016 Code For Orlando. All rights reserved.
//

import XCTest
@testable import PetAdoptionTransportKit

class PetAdoptionTransportKitTests: XCTestCase {
    
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
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testGetPets() {
        let expectation = self.expectationWithDescription("Collected All pets")
        PTKRequestManager.sharedInstance().requestAllPets { (pets, error) in
            if error != nil {
                XCTFail("Failed to get pets: \(error!.localizedDescription)")
            }
            
            expectation.fulfill()
        }
        
        self.waitForExpectationsWithTimeout(10.0) { (error: NSError?) in
            if error != nil {
                XCTFail("Failed to collect pets: \(error!.localizedDescription)")
            }
        }
    }
    
}
