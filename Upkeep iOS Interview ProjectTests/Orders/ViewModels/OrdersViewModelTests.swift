//
//  OrdersViewModelTests.swift
//  Upkeep iOS Interview ProjectTests
//
//  Created by apple on 29/10/23.
//

import XCTest
@testable import Upkeep_iOS_Interview_Project

final class OrdersViewModelTests: XCTestCase {
    
    var ordersViewModel = OrdersViewModelStub()
    var ordersViewDelegate = OrdersViewDelegateStub()
    
    override func setUp() {
        ordersViewModel.delegate = ordersViewDelegate
        ordersViewModel.fetchOrders()
        XCTAssert(ordersViewModel.fetchOrdersCalled == true)
        XCTAssert(ordersViewDelegate.startLoaderCalled == true)
        XCTAssert(ordersViewDelegate.stopLoaderCalled == true)
    }
    
    func testRowsCount() {
        XCTAssert(ordersViewModel.rowCount == 15)
    }
    
    func testOrder(){
        let order = ordersViewModel.getOrder(indexPath: IndexPath(row: 0, section: 0))
        XCTAssert(order?.title == "Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet")
        XCTAssert(order?.description == "Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat. est Lorem ipsum dolor sit amet")
    }

    func testPerformanceFetchOrders() throws {
        self.measure {
            ordersViewModel.fetchOrders()
        }
    }

}
