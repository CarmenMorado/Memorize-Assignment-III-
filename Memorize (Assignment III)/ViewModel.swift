//
//  ViewModel.swift
//  Memorize (Assignment III)
//
//  Created by Carmen Morado on 9/15/21.
//

import SwiftUI

class ViewModel: ObservableObject {
    typealias Card = Model<String>.Card
    
    private static let emojis = ["🚗","🚌","🚑","🚜","🛴","🚲","🚔","🛺","🚘","🚃","🚄","🚠","🚅","✈️","🚀","🛸","🚁","🛶","🚤","🚢","🛳","🚓","🚛","🛵"]
    
    private static func createMemoryGame() -> Model<String> {
        Model<String>(numberOfPairsOfCards: 6)  { pairIndex in
            emojis[pairIndex]
        }
    }
    
    @Published private var model = createMemoryGame()
    
    var cards: Array<Card> {
        return model.cards
    }
    
    func choose(_ card: Card) {
        model.choose(card)
    }
}

