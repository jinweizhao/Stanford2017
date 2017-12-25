//
//  Concentration.swift
//  Concentration
//
//  Created by 靳玮昭 on 2017/12/21.
//  Copyright © 2017年 Will-Z. All rights reserved.
//

import Foundation

struct Concentration {
    
    private(set) var cards = [Card]()
    
    private var indexOfOneAndOnlyFaceUpCard: Int?{//当只有一个卡片朝上时，这个卡片的index
        get {
            var foundIndex: Int?
            for index in cards.indices {
                if cards[index].isFaceUp {
                    if foundIndex == nil {
                        foundIndex = index
                    } else {
                        return nil
                    }
                }
            }
            return foundIndex
        }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
    mutating func chooseCard(at index: Int) {
        assert(cards.indices.contains(index), "Concentration.chooseCard(at: \(index)) chosen index not in the cards")
        if !cards[index].isMatched {
            
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                if cards[matchIndex].identifier == cards[index].identifier {
                    
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
//                indexOfOneAndOnlyFaceUpCard = nil
            }else {//没有卡朝上或者两张卡朝上
                
//                for flipDownIndex in cards.indices {
//                    cards[flipDownIndex].isFaceUp = false
//                }
//                cards[index].isFaceUp = true
                
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    init(numberOfPairsOfCards: Int) {
        assert(numberOfPairsOfCards > 0, "Concentration.init(numberOfPairsOfCards: \(numberOfPairsOfCards)) you must have at least one pair of Card")
        for _ in 1...numberOfPairsOfCards {
            
            let card = Card()
            
            cards += [card, card]
            
        }
    }
    
    
    // TODO: shuffle the cards
    
}

