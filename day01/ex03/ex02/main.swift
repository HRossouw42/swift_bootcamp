//
//  main.swift
//  ex01
//
//  Created by Harmun Rossouw on 2019/10/09.
//  Copyright © 2019 Harmun Rossouw. All rights reserved.
//

import Foundation

//Create an enum Color with String type as the raw value that will represent the 4 colors. Add a constant static allColors of type [Color] which will represent all the possible colors of a card.
//Now create an enum Value with the raw value of the type Int which will represent the values of the cards. Add a constant static allValues of type [Value] which will represent all the possible values of a card.


var colorArray = Color.allColors
var valueArray = Value.allValues

//print("All colours are:")
//for col in colorArray{
//    print("Suite of \(col) has color \(col.rawValue)")
//}
//
//print("\nAll values are:")
//for val in valueArray{
//    print("Card type \(val) has value \(val.rawValue)")
//}


var card1 = Card(col:Color.Heart, val:Value.Ace)
var card2 = Card(col:Color.Spade, val:Value.Queen)
var card3 = Card(col:Color.Heart, val:Value.Ace)

print(card1.description)
print(card2.description)
print(card3.description)

print("Is card 1 the same as card 2?")
print(card1 == card2)
print("Is card 1 the same as card 3?")
print(card1 == card3)


var deckofSpades:[Card] = Deck.allSpades
var bigDeck:[Card] = Deck.allCards

print("Deck of Spades")
print(deckofSpades)
//print("Counting cards...")
//print(deckofSpades.count)
//print(deckofSpades.shuffled())

print("That's a big deck")
print(bigDeck)
//print("Counting cards...")
//print(bigDeck.count)

//print("Now let's shuffle them...")
print(bigDeck.shuffleDeck)
//print(bigDeck.shuffled())
