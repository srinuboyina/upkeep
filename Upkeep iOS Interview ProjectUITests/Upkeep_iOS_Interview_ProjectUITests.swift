//
//  Upkeep_iOS_Interview_ProjectUITests.swift
//  Upkeep iOS Interview ProjectUITests
//
//  Created by Alex Bush | Upkeep on 8/30/21.
//

import XCTest

class Upkeep_iOS_Interview_ProjectUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testWithViewOnlyUser() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        XCTAssert(app.buttons["Login as View Only User"].exists)
        app.staticTexts["Login as View Only User"].tap()
        let viewOnlyUserNavigationBar = app.navigationBars["View Only User"]
        if viewOnlyUserNavigationBar.waitForExistence(timeout: 2) {
            viewOnlyUserNavigationBar.buttons["Done"].tap()
            let tablesQuery = app.tables
            XCTAssert(tablesQuery["OrderTable"].exists)
            
            let orderTable = tablesQuery["OrderTable"]
            if orderTable.exists {
                if orderTable.cells.count > 0 {
                    let cell = orderTable.cells.firstMatch
                    cell.tap()
                    XCTAssert(app.staticTexts["Order details"].exists)
                }
            }
        }
    }
    
    func testWithAdmin() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        XCTAssert(app.buttons["Admin Button"].exists)
        app.staticTexts["Login as Admin"].tap()
        app.navigationBars["Admin"].buttons["Done"].tap()
        let tablesQuery = app.tables
        let orderTable = tablesQuery["OrderTable"]
        if orderTable.exists {
            if orderTable.cells.count > 0 {
                let cell = orderTable.cells.firstMatch
                cell.tap()
                XCTAssert(app.staticTexts["Order details"].exists)
            }
        }
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
