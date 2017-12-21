//
//  Concentration.swift
//  Concentration
//
//  Created by 靳玮昭 on 2017/12/21.
//  Copyright © 2017年 Will-Z. All rights reserved.
//

import Foundation

class Concentration {
    
    var cards = [Card]()
    
    func chooseCard(at index: Int) {
        
        cards[index].isFaceUp = !cards[index].isFaceUp
        
    }
    
    init(numberOfPairsOfCards: Int) {
        
        for _ in 1...numberOfPairsOfCards {
            
            let card = Card()
            
            cards += [card, card]
            
        }
    }
    
    
    // TODO shuffle the cards
    
}

