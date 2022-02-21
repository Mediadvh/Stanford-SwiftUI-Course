//
//  MemoryGame.swift
//  Project1
//
//  Created by Media Davarkhah on 12/2/1400 AP.
//

import Foundation
struct MemoryGame<CardContent> {
    private(set) var cards: Array<Card>
    
    func choose(_ card: Card) {
        
    }
    init(numberOfCards: Int, cardContent: (Int) -> CardContent) {
        cards = Array<Card>()
        for cardIndex in 0..<numberOfCards {
            let content = cardContent(cardIndex)
            cards.append(Card(content: content))
            cards.append(Card(content: content))
        }
    }
    
    struct Card {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
    }
}
