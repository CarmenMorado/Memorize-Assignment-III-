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
    
    func dealThreeMoreCards() {
        model.dealThreeMoreCards()
    }
    
}

