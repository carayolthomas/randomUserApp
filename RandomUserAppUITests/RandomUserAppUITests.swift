//
//  RandomUserAppUITests.swift
//  RandomUserAppUITests
//
//  Created by Thomas Carayol on 18/09/2018.
//  Copyright © 2018 Thomas Carayol. All rights reserved.
//

import XCTest

class RandomUserAppUITests: XCTestCase {
    
    var app: XCUIApplication!
    
    override func setUp() {
        super.setUp()
        
        self.app = XCUIApplication()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    /// Just a quick test to test the navigation push / pop
    func testNavigation() {
                        
        self.app.launch()
        
        XCTAssertTrue(app.isDisplayingUserList)
        app.tapOnFirstElement()
        XCTAssertTrue(app.isDisplayingUserDetails)
        app.goBack()
        XCTAssertTrue(app.isDisplayingUserList)
    }
    
}
