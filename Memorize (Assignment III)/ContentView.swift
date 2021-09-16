//
//  ContentView.swift
//  Memorize (Assignment III)
//
//  Created by Carmen Morado on 9/15/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var game: ViewModel
    
    var body: some View {
        AspectVGrid(items: game.cards, aspectRatio: 2/3) { card in
            if card.isMatched && !card.isFaceUp {
                Rectangle().opacity(0)
            }
            
            else {
                CardView(card: card)
                    .padding(4)
                    .onTapGesture {
                        game.choose(card)
                }
            }
        }
            .foregroundColor(/*@START_MENU_TOKEN@*/.red/*@END_MENU_TOKEN@*/)
            .padding(.horizontal)
    }
}

struct CardView: View {
    let card: ViewModel.Card
    
    var body: some View {
        GeometryReader(content: {geometry in
            ZStack {
                let shape = RoundedRectangle(cornerRadius: DrawingConstants.cornerRadius)
                if card.isFaceUp {
                    shape.fill().foregroundColor(.white)
                    shape.strokeBorder(lineWidth: DrawingConstants.lineWidth)
                        .padding(5).opacity(0.5)
                    Text(card.content).font(font(in: geometry.size))
                    
                }
                
                else if card.isMatched {
                    shape.opacity(0)
                }
                
                else {
                    shape.fill()
                }
            }
        })
    }
    
    private func font(in size: CGSize) -> Font {
        Font.system(size: min(size.width, size.height) * DrawingConstants.fontScale)
    }
    
    private struct DrawingConstants {
        static let cornerRadius: CGFloat = 10
        static let lineWidth: CGFloat = 3
        static let fontScale: CGFloat = 0.7
    }
}








struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = ViewModel()
        game.choose(game.cards.first!)
        return ContentView(game: game)
    }
}

