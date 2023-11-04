//
//  OrdersViewModel.swift
//  Upkeep iOS Interview Project
//
//  Created by apple on 28/10/23.
//

import Foundation
import Combine

// this code can be converted to combine
protocol OrdersViewDelegate: AnyObject {
    func dataFetched()
    func startLoader()
    func stopLoader()
    func showError(error: ErrorModel2)
}

protocol OrdersViewModelProtocol {
    var rowCount: Int {get}
    func getOrder(indexPath: IndexPath) -> OrderViewModelProtocol?
    var orders: Orders? {get set}
    var delegate: OrdersViewDelegate? {get set}
    func fetchOrders()
}

enum LoaderState {
    case show
    case stop
}

final class OrdersViewModel: OrdersViewModelProtocol {
    
    let showLoader: PassthroughSubject<Void, Never>? = nil
    
    var error: ErrorModel2?
    var orders: Orders?
    weak var delegate: OrdersViewDelegate?
    
    var rowCount: Int {
        return orders?.workOrders.count ?? 0
    }
    
    func getOrder(indexPath: IndexPath) -> OrderViewModelProtocol? {
        let order = orders?.workOrders[indexPath.row]
        let viewModel = OrderViewModel(order: order!)
        return viewModel
    }
    
    func fetchOrders() {
        NetworkManager().fetchApiData(urlString: Server.orders) { data, error in
            self.orders = data
            self.delegate?.dataFetched()
        }
    }

}
