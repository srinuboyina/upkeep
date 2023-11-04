//
//  Constants.swift
//  Upkeep iOS Interview Project
//
//  Created by apple on 28/10/23.
//

import Foundation

let ordersURL = "http://localhost:3000/server/work-orders.json"

struct Constants {
    static let loginAsAdmin = "Login as Admin"
    static let admin = "Admin"
    static let loginAsViewOnlyUser = "Login as View Only User"
    static let viewOnlyUser = "View Only User"
    static let serverError = "Not able to connect to the server"
    static let error = "Error"
    static let orderDetails = "Order details"
    static let sigOut = "Sign Out"
    static let ok = "OK"
    static let adminButton = "Admin Button"
    static let ordersTable = "OrderTable"
}

struct Server {
    static let orders = "http://localhost:3000/server/work-orders.json"
}
