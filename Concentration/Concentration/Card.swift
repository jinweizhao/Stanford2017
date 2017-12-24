//
//  Card.swift
//  Concentration
//
//  Created by 靳玮昭 on 2017/12/21.
//  Copyright © 2017年 Will-Z. All rights reserved.
//

import Foundation


struct Card{
    
    var isFaceUp = false
    
    var isMatched = false
    
    var identifier: Int
    
    private static var identifierFactory = 0
    
    private static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    
    
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
    
}
