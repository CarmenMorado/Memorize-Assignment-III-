//
//  CardView.swift
//  Memorize (Assignment III)
//
//  Created by Carmen Morado on 9/21/21.
//

import SwiftUI

struct CardView: View {
    let card: Card

    var body: some View {
        GeometryReader { geometry in
            self.body(for: geometry.size)
        }
    }

    func body(for size: CGSize) -> some View {
        return HStack {
            ForEach(0..<card.number) { _ in
                self.cardSymbol.aspectRatio(0.5, contentMode: .fit)
            }
        }
        .padding(size.height / 10)
        .cardify(isSelected: card.isSelected, isMatched: card.isMatched, isHint: card.isHint)
    }

    var cardSymbol: some View {
        return ZStack {
            cardShape.fill(cardColor).opacity(cardShading)
            cardShape.stroke(cardColor, style: StrokeStyle(lineWidth: 2, lineCap: .round, lineJoin: .round))
        }
    }

    var cardShape: some Shape {
        switch self.card.shape {
            case .diamond: return AnyShape(Diamond())
            case .oval: return AnyShape(Oval())
            case .squiggle: return AnyShape(Squiggle())
        }
    }

    var cardColor: Color {
        switch card.color {
            case .red: return Color.red
            case .purple: return Color.purple
            case .green: return Color.green
        }
    }

    var cardShading: Double {
        switch card.shading {
            case .solid: return 1.0
            case .striped: return 0.3
            case .outlined: return 0.0
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        let card = Card(shape: .diamond, number: 3, color: .green, shading: .solid)

        return CardView(card: card)
    }
}
