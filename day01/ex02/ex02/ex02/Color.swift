//
//  Color.swift
//  ex00
//
//  Created by Harmun Rossouw on 2019/10/09.
//  Copyright © 2019 Harmun Rossouw. All rights reserved.
//

import Foundation

enum Color: String {
    case Club = "green"
    case Diamond = "blue"
    case Spade = "black"
    case Heart = "red"
    
    static let allColors: [Color] = [Club, Diamond, Spade, Heart]
}
