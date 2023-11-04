//
//  OrdersViewControllerTests.swift
//  Upkeep iOS Interview ProjectTests
//
//  Created by apple on 29/10/23.
//

import XCTest
@testable import Upkeep_iOS_Interview_Project

final class OrdersViewControllerTests: XCTestCase {

    let viewModel = OrdersViewModelStub()
    var viewController: OrdersViewController!
    
    override func setUp() {
        viewController = OrdersViewController(viewModel: self.viewModel)
    }
    
    func testViewDidLoad() {
        viewController.viewDidLoad()
        XCTAssertNotNil(viewController.view)
    }
    
    func testOrdersData() {
        viewController.fetchButtonPressed()
    }

    func test_initWithDecoder() {
        let controller = OrdersViewController(coder: NSCoder())
        XCTAssertNil(controller)
    }
    
    override func tearDown() {
        viewController = nil
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
