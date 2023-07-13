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
            AspectVGrid(items: viewmodel.cards, aspectRation: 2/3){ card in
                CardView(card: card)
                    .padding(4)
                    .onTapGesture {
                        viewmodel.choose(card)
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
                    
                    CircleShape(startAngle: Angle(degrees: 0 - 90), endAngle: Angle(degrees: 1 - 90)).padding(5).opacity(0.5)
                    
                } else if (card.isMatched){
                    shape.opacity(0)
                } else {
                    shape.fill()
                }
                
                Text(card.content)
                    .rotationEffect(Angle.degrees(card.isMatched ? 360 : 0))
                    .animation(Animation.linear(duration: 1).repeatForever(autoreverses: false))
                    .font(Font.system(size: DrawingConstans.fontSize))
                    .scaleEffect(scale(thatFits: geometry.size))
                    .opacity(card.isFaceUp ? 1 : 0)
            }
        }
    }
    
    private func scale(thatFits size: CGSize) -> CGFloat {
        min(size.width, size.height) / (DrawingConstans.fontSize / DrawingConstans.fontScale)
    }
    
    private struct DrawingConstans {
        static let cornerRadius: CGFloat = 10
        static let lineWidth: CGFloat = 2
        static let fontScale: CGFloat = 0.6
        static let fontSize: CGFloat = 32
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        game.choose(game.cards.first!)
        return EmojiMemoryGameView(viewmodel: game)
            .preferredColorScheme(.light)
//        return EmojiMemoryGameView(viewmodel: game)
//            .preferredColorScheme(.dark)
            
    }
}
