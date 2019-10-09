//
//  Card.swift
//  ex01
//
//  Created by Harmun Rossouw on 2019/10/09.
//  Copyright © 2019 Harmun Rossouw. All rights reserved.
//

import Foundation

class Card: NSObject {
    var color:Color
    var value:Value
    
    override var description: String {
        return "Colour of \(self.color) with value of \(value)"
    }
    
    init(col:Color, val:Value) {
        self.color = col
        self.value = val
    }
    
    func isEqual(object: AnyObject?) -> Bool {
        if let object = object as? Card {
            return value == object.value
        } else {
            return false
        }
    }
    
    static func == (lhs: Card, rhs: Card) -> Bool {
        return (lhs.value == rhs.value)
    }
    
}
