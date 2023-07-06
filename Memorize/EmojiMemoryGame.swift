//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Abu Raihan Rony on 4/7/23.
//

import SwiftUI



class EmojiMemoryGame: ObservableObject {
    
    typealias Card = MemoryGame<String>.Card
    
    private static let emojies = ["🚁","✈️","🚚","🚆","🚑","🚔","🛻","🚜","🛳️","🚂","🚲","🛵","🚗","🚕","🚙","🚌","🚎","🏎️","🚓","⛴️","🚒","🚐","🚍","🚛","🚘","🚖","🚀"]
    
    
    private static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 10) { pairIndex in
                emojies[pairIndex]
            }
    }
    
    @Published private var model = createMemoryGame()
    
    var cards: Array<Card> {
        return model.cards
    }
    
    // MARK: - Intent(s)
    
    func choose(_ card: Card){
        objectWillChange.send()
        model.choose(card)
    }
    
}
