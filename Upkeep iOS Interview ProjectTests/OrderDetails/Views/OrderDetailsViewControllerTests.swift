//
//  OrderDetailsViewControllerTests.swift
//  Upkeep iOS Interview ProjectTests
//
//  Created by apple on 29/10/23.
//

import XCTest
@testable import Upkeep_iOS_Interview_Project

final class OrderDetailsViewControllerTests: XCTestCase {

    let viewModel = OrderViewModelStub()
    var viewController: OrderDetailsViewController!
    
    override func setUp() {
        viewController = OrderDetailsViewController(viewModel: viewModel)
    }
    
    func testViewDidLoad() {
        viewController.viewDidLoad()
        XCTAssertNotNil(viewController.view)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
