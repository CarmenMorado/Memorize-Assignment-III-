//
//  Model.swift
//  Memorize (Assignment III)
//
//  Created by Carmen Morado on 9/15/21.
//

import Foundation

struct Model<CardContent> where CardContent: Equatable{
    private(set) var cards: Array<Card>
    
    private var indexOfTheOneAndOnlyFaceUpCard: Int? {
        get {cards.indices.filter({ cards[$0].isFaceUp}).oneAndOnly}
        set{
            cards.indices.forEach{cards[$0].isFaceUp = ($0 == newValue)}
            
        }
    }
    
    mutating  func choose(_ card: Card) {
        //if let chosenIndex = index(of: card) {
        if let chosenIndex = cards.firstIndex(where: {$0.id == card.id}),
           !cards[chosenIndex].isFaceUp,
           !cards[chosenIndex].isMatched {
            if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
                if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                }
                cards[chosenIndex].isFaceUp = true
               
            } else {
                indexOfTheOneAndOnlyFaceUpCard = chosenIndex
            }
            
        }
        print("\(cards)")
    }
    
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = []
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = createCardContent(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2+1))
        }
    }
    
    struct Card: Identifiable {
        var isFaceUp = false
        var isMatched = false
        let content: CardContent
        let id: Int
    }
}

extension Array {
    var oneAndOnly: Element? {
        if count == 1 {
            return first
        }
    
        else {
            return nil
        }
    }
}
