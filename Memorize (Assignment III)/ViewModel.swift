//
//  ViewModel.swift
//  Memorize (Assignment III)
//
//  Created by Carmen Morado on 9/19/21.
//

import SwiftUI

class ViewModel: ObservableObject {
    @Published var model: Model
    
    init() {
        self.model = Model()
    }
    
   // private static let emojis = ["🚗","🚌","🚑","🚜","🛴","🚲","🚔","🛺","🚘","🚃","🚄","🚠","🚅","✈️","🚀","🛸","🚁","🛶","🚤","🚢","🛳","🚓","🚛","🛵"]
    
//    private static func createMemoryGame() -> Model<String> {
//        Model<String>(numberOfPairsOfCards: 6)  { pairIndex in
//            emojis[pairIndex]
//        }
//    }
    
//    @Published private var model = createMemoryGame()
    
    var cards: [Card] {
        return model.cards
    }

    var cardsToShow: [Card] {
        Array(self.cards.filter { !$0.isHidden }.prefix(self.model.numberOfCardsToShow))
    }
    
    func newGame() {
        model.newGame()
    }
    
    func chose(card: Card) {
        model.chose(card: card)
    }
    
    func showHint() -> Bool {
        model.showHint()
    }
    
  //  var cards: Array<Card> {
  //      return model.cards
  //  }
    
  //  func choose(_ card: Card) {
  //      model.choose(card)
  //  }
}

