//
//  RestoFinderUITests.swift
//  RestoFinderUITests
//
//  Created by Iman Zarrabian on 11/01/2017.
//  Copyright © 2017 Iman Zarrabian. All rights reserved.
//

import XCTest

class RestoFinderUITests: XCTestCase {
        
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
    
    func testListResto() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let tablesQuery = XCUIApplication().tables
        tablesQuery.staticTexts["Dans un décor néo-baroque aux tons rouges, ce restaurant propose 4 menus pour une cuisine d'ici et d'ailleurs."].swipeUp()
        tablesQuery.staticTexts["Cuisine française traditionnelle servie dans la salle opulente (fresques et dorures) de ce restaurant de gare."].swipeDown()
    }

    func testDetailResto() {
        XCUIApplication().tables.staticTexts["Paris Hanoï444"].tap()

        XCTAssert(XCUIApplication().navigationBars.staticTexts["Paris Hanoï44"].exists)

    }

}
