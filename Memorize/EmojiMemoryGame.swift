//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Abu Raihan Rony on 4/7/23.
//

import SwiftUI



class EmojiMemoryGame: ObservableObject {
    
    static let emojies = ["🚁","✈️","🚚","🚆","🚑","🚔","🛻","🚜","🛳️","🚂","🚲","🛵","🚗","🚕","🚙","🚌","🚎","🏎️","🚓","⛴️","🚒","🚐","🚍","🚛","🚘","🚖","🚀"]
    
    
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 10) { pairIndex in
                emojies[pairIndex]
            }
    }
    
    @Published private var model: MemoryGame<String> = createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    // MARK: - Intent(s)
    
    func choose(_ card: MemoryGame<String>.Card){
        objectWillChange.send()
        model.choose(card)
    }
    
}
