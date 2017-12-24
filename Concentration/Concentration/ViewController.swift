//
//  ViewController.swift
//  Concentration
//
//  Created by KDB on 2017/12/20.
//  Copyright © 2017年 Will-Z. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var game = Concentration(numberOfPairsOfCards: numberOfPairsOfCards)
    
    var numberOfPairsOfCards: Int {//只读  省略get{ }
        return (cardButtons.count + 1) / 2
    }
    
    @IBOutlet private weak var flipCountLabel: UILabel!
    
    @IBOutlet private var cardButtons: [UIButton]!
    
    private(set) var flipCount = 0 {
        didSet {
            flipCountLabel.text = "flipCount:\(flipCount)"
        }
    }
    
    @IBAction private func touchCard(_ sender: UIButton) {
        
        flipCount += 1
        
        if let cardNumber = cardButtons.index(of: sender) {
            
            game.chooseCard(at: cardNumber)
            
            updateViewFromModel()
            
        } else {
            print("nil")
        }
    }
    
    private func updateViewFromModel() {
        
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: .normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            }else {
                button.setTitle("", for: .normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
            }
        }
        
    }
    
    private var emojiChoices = ["🦇", "🎃", "🍭", "👻", "😈"]
    
    private var emoji = [Int: String]()//[0 : 🎃,]
    
    private func emoji(for card: Card) -> String {
        
        if emoji[card.identifier] == nil, emojiChoices.count > 0 {
//                let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
                emoji[card.identifier] = emojiChoices.remove(at: emojiChoices.count.arc4random)
        }
//        if emoji[card.identifier] != nil {
//            return emoji[card.identifier]！
//        }else {
//            return "?"
//        }
        return emoji[card.identifier] ?? "?"
    }
}


extension Int {
    
    var arc4random: Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        }else if self < 0 {
            return -Int(arc4random_uniform(UInt32(-self)))
        }else {
            return 0
        }
    }
    
}










