//
//  OrdersViewModelStub.swift
//  Upkeep iOS Interview ProjectTests
//
//  Created by apple on 29/10/23.
//

import Foundation
@testable import Upkeep_iOS_Interview_Project

// negative test cases need to write

class OrdersViewModelStub: OrdersViewModelProtocol {
    var rowCount: Int {
        return orders?.workOrders.count ?? 0
    }
    
    func getOrder(indexPath: IndexPath) -> OrderViewModelProtocol? {
        let order = orders?.workOrders[indexPath.row]
        return OrderViewModel(order: order!)
    }
    
    var orders: Orders?
    
    var delegate: OrdersViewDelegate?
    
    var fetchOrdersCalled = false
    func fetchOrders() {
        loadMockJSON()
        fetchOrdersCalled = true
    }
    
    private func loadMockJSON() {
        self.delegate?.startLoader()
        let result: Result<Orders, ErrorModel> = JSONParser().loadJSON(filename: "work-orders")
        switch result {
        case .failure(let error):
            debugPrint("error occured \(error)")
            self.delegate?.stopLoader()
            break
        case .success(let data):
            self.orders = data
            self.delegate?.dataFetched()
            self.delegate?.stopLoader()
            break
        }
    }
    
}
