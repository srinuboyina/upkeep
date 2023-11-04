//
//  OrdersViewDelegateStub.swift
//  Upkeep iOS Interview ProjectTests
//
//  Created by apple on 29/10/23.
//

import Foundation
@testable import Upkeep_iOS_Interview_Project

class OrdersViewDelegateStub: OrdersViewDelegate {
    var dataFetchedCalled = false
    func dataFetched() {
        dataFetchedCalled = true
    }
    
    var startLoaderCalled = false
    func startLoader() {
        startLoaderCalled = true
    }
    
    var stopLoaderCalled = false
    func stopLoader() {
        stopLoaderCalled = true
    }
    
    var showErrorCalled = false
    func showError() {
        showErrorCalled = true
    }
    
    
}
