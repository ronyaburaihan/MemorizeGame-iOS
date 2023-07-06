//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Abu Raihan Rony on 3/7/23.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    
    @ObservedObject var viewmodel: EmojiMemoryGame
    
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
    
    let card: EmojiMemoryGame.Card
    
    var body : some View {
        GeometryReader { geometry in
            ZStack {
                let shape = RoundedRectangle(cornerRadius: DrawingConstans.cornerRadius)
                if card.isFaceUp {
                    shape.fill().foregroundColor(Color.white)
                    shape.strokeBorder(lineWidth: DrawingConstans.lineWidth)
                    Circle().padding(5).opacity(0.5)
                    Text(card.content)
                        .font(Font.system(size: min(geometry.size.width, geometry.size.height) * DrawingConstans.fontScale))
                } else if (card.isMatched){
                    shape.opacity(0)
                } else {
                    shape.fill()
                }
            }
        }
    }
}

private struct DrawingConstans {
    static let cornerRadius: CGFloat = 15
    static let lineWidth: CGFloat = 2
    static let fontScale: CGFloat = 0.6
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        EmojiMemoryGameView(viewmodel: game)
            .preferredColorScheme(.light)
        EmojiMemoryGameView(viewmodel: game)
            .preferredColorScheme(.dark)
            
    }
}
