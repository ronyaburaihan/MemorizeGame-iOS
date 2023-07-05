//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Abu Raihan Rony on 3/7/23.
//

import SwiftUI

@main
struct MemorizeApp: App {
    
    let game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewmodel: game)
        }
    }
}
