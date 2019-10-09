//
//  Deck.swift
//  ex02
//
//  Created by Harmun Rossouw on 2019/10/09.
//  Copyright © 2019 Harmun Rossouw. All rights reserved.
//

import Foundation
//https://www.associatedtype.net/2017/09/first-steps-with-swift-representing-cards-in-a-deck/

class Deck: NSObject {
    
    static let allSpades: [Card] = Value.allValues.map({Card(col: Color.Spade, val: $0)})
    static let allDiamonds: [Card] = Value.allValues.map({Card(col: Color.Diamond, val: $0)})
    static let allHearts: [Card] = Value.allValues.map({Card(col: Color.Heart, val: $0)})
    static let allClubs: [Card] = Value.allValues.map({Card(col: Color.Club, val: $0)})
    
    static let allCards: [Card] = allSpades + allDiamonds + allHearts + allClubs
    
    }

extension Array {
    //https://src-bin.com/en/q/16e9d8e
    var shuffleDeck : Array {
        let totalCount : Int = self.count
        var shuffledArray : Array = []
        var count : Int = totalCount
        var tempArray : Array = self
        for _ in 0..<totalCount {
            let randomIndex : Int = Int(arc4random_uniform(UInt32(count)))
            let randomElement : Element = tempArray.remove(at: randomIndex)
            shuffledArray.append(randomElement)
            count -= 1
        }
        return shuffledArray
    }
    
}
