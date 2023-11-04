//
//  OrderBuilder.swift
//  Upkeep iOS Interview ProjectTests
//
//  Created by apple on 29/10/23.
//

import Foundation
@testable import Upkeep_iOS_Interview_Project

class OrderBuilder {
    var title = "Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet"
    var description = "Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat. est Lorem ipsum dolor sit amet"
    
    func with(title: String) -> OrderBuilder {
        self.title = title
        return self
    }
    
    func with(description: String) -> OrderBuilder {
        self.description = description
        return self
    }
    
    func build() -> Order {
        return Order(title: title, description: description)
    }
}
