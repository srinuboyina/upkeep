//
//  Order.swift
//  Upkeep iOS Interview Project
//
//  Created by apple on 28/10/23.
//

import Foundation

struct Order: Decodable {
    let title: String
    let description: String
}

struct Orders: Decodable {
    let workOrders: [Order]
    private enum CodingKeys: String, CodingKey {
        case workOrders = "work_orders"
    }

}
