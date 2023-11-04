//
//  OrderViewModel.swift
//  Upkeep iOS Interview Project
//
//  Created by apple on 28/10/23.
//

import Foundation

protocol OrderViewModelProtocol {
    var title: String {get set}
    var description: String {get set}
}

class OrderViewModel: OrderViewModelProtocol {
    var title: String
    var description: String
    
    init(order: Order) {
        self.title = order.title
        self.description = order.description
    }
}
