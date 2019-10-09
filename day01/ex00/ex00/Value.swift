//
//  Value.swift
//  ex00
//
//  Created by Harmun Rossouw on 2019/10/09.
//  Copyright © 2019 Harmun Rossouw. All rights reserved.
//

import Foundation

enum Value: Int {
    case King = 13
    case Queen = 12
    case Jack = 11
    case Ten = 10
    case Nine = 9
    case Eight = 8
    case Seven = 7
    case Six = 6
    case Five = 5
    case Four = 4
    case Three = 3
    case Two = 2
    case Ace = 1
    
    static let allValues: [Value] = [King, Queen, Jack, Ten, Nine, Eight, Seven, Six, Five, Four, Three, Two, Ace]
}


