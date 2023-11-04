//
//  AutoLayoutPropertyWrapper.swift
//  Upkeep iOS Interview Project
//
//  Created by apple on 01/11/23.
//

import UIKit

@propertyWrapper
public struct UseAutoLayout<T: UIView> {
    public var wrappedValue: T {
        didSet {
            setAutoLayout()
        }
    }

    public init(wrappedValue: T) {
        self.wrappedValue = wrappedValue
        setAutoLayout()
    }

    func setAutoLayout() {
        wrappedValue.translatesAutoresizingMaskIntoConstraints = false
    }
}
