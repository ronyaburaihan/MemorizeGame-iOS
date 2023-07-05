//
//  MemoryGame.swift
//  Memorize
//
//  Created by Abu Raihan Rony on 4/7/23.
//

import Foundation


struct MemoryGame<CardContent> {
    
    private(set) var cards: Array<Card>
    
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
        self.cards = Array<Card>()
        
        for pairIndex in 0..<numberOfPairsOfCards {
            let content: CardContent = createCardContent(pairIndex)
            cards.append(Card(id: pairIndex * 2,content: content))
            cards.append(Card(id: pairIndex * 2 + 1 ,content: content))
        }
    }
    
    mutating func choose(_ card: Card){
        let chosenIndex = index(card: card)
        cards[chosenIndex].isFaceUp.toggle()
        print("choosenCard = \(cards)")
    }
    
    func index(card: Card) -> Int{
        for index in 0..<cards.count {
            if cards[index].id == card.id{
                return index
            }
        }
        return 0
    }
    
    struct Card : Identifiable{
        var id: Int
        var isFaceUp: Bool = true
        var isMatched: Bool = false
        var content: CardContent
    }
}
