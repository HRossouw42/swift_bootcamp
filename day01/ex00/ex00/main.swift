//
//  main.swift
//  ex00
//
//  Created by Harmun Rossouw on 2019/10/09.
//  Copyright © 2019 Harmun Rossouw. All rights reserved.
//

import Foundation

//Create an enum Color with String type as the raw value that will represent the 4 colors. Add a constant static allColors of type [Color] which will represent all the possible colors of a card.
//Now create an enum Value with the raw value of the type Int which will represent the values of the cards. Add a constant static allValues of type [Value] which will represent all the possible values of a card.

var colorArray = Color.allColors
var valueArray = Value.allValues

print("All colours are:")
for col in colorArray{
    print("Suite of \(col) has color \(col.rawValue)")
}

print("\nAll values are:")
for val in valueArray{
    print("Card type \(val) has value \(val.rawValue)")
}
