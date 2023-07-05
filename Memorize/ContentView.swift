//
//  ContentView.swift
//  Memorize
//
//  Created by Abu Raihan Rony on 3/7/23.
//

import SwiftUI

struct ContentView: View {
    
    var viewmodel: EmojiMemoryGame
    
    var body: some View {
        VStack{
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))]) {
                    ForEach(viewmodel.cards) { card in
                        CardView(card: card)
                            .aspectRatio(2/3, contentMode: .fill)
                            .onTapGesture {
                                viewmodel.choose(card)
                            }
                    }
                }
                
            }
            .foregroundColor(Color.red)
            
            Spacer(minLength: 10)
            
            HStack{
                removeButton
                Spacer()
                addButton
            }
            .font(.largeTitle)
            .padding(.horizontal)
            
        }
        .padding(.horizontal)
    }
    
    var addButton: some View {
        Button {
            //if emojiCount < emojies.count {
             //   emojiCount += 1
            //}
        } label: {
            Image(systemName: "plus.circle")
        }
    }
    
    var removeButton: some View {
        Button {
            //if emojiCount > 1 {
            //    emojiCount -= 1
            //}
        } label: {
            Image(systemName: "minus.circle")
        }
    }
}

struct CardView: View {
    
    let card: MemoryGame<String>.Card
    
    var body : some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 15)
            if card.isFaceUp {
                shape.fill().foregroundColor(Color.white)
                shape.strokeBorder(lineWidth: 3)
                Text(card.content).font(.largeTitle)
            } else {
                shape.fill()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        ContentView(viewmodel: game)
            .preferredColorScheme(.light)
        ContentView(viewmodel: game)
            .preferredColorScheme(.dark)
            
    }
}
