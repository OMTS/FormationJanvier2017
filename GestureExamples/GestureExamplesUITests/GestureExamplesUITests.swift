//
//  GestureExamplesUITests.swift
//  GestureExamplesUITests
//
//  Created by Iman Zarrabian on 17/01/2017.
//  Copyright © 2017 Iman Zarrabian. All rights reserved.
//

import XCTest

class GestureExamplesUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        
        let element3 = XCUIApplication().children(matching: .window).element(boundBy: 0).children(matching: .other).element
        let element = element3.children(matching: .other).element(boundBy: 0)
        element.swipeDown()
        
        let element2 = element3.children(matching: .other).element(boundBy: 1)
        element2.swipeRight()
        element2.swipeDown()
        element.twoFingerTap()
        element.twoFingerTap()


    }
    
}
