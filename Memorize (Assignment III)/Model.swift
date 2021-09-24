//
//  Model.swift
//  Memorize (Assignment III)
//
//  Created by Carmen Morado on 9/19/21.
//

import Foundation

struct Model//<CardContent> where CardContent: Equatable
{
    static private let defaultNumberOfCardsToShow = 12
    
    private(set) var cards: [Card]
    private(set) var numberOfCardsToShow = defaultNumberOfCardsToShow
    private var selectedIndices: [Int]
    
    init() {
        selectedIndices = [Int]()
        cards = [Card]()
    }
    
    mutating func newGame() {
        selectedIndices.removeAll()
        cards.removeAll()
        numberOfCardsToShow = Model.defaultNumberOfCardsToShow

        for shape in CardShape.allCases {
            for color in CardColor.allCases {
                for number in 1...3 {
                    for shading in CardShading.allCases {
                        let card = Card(shape: shape, number: number, color: color, shading: shading)

                        self.cards.append(card)
                    }
                }
            }
        }

        cards.shuffle()
    }
    
    mutating func chose(card: Card) {
        if let index = cards.firstIndex(where: { $0 == card }), cards[index].isMatched != true {
            if selectedIndices.count > 2 {
                deselectAllCards()
                //reduceNumberOfVisibleCards()
            }

            cards[index].isSelected = !cards[index].isSelected
            if cards[index].isSelected {
                selectedIndices.append(index)

                if areThreeCardsSelected {
                    if areSelectedCardsASet {
                        markSelectedCardsAsMatched()
                    } else {
                        markSelectedCardsAsNotMatched()
                    }
                }
            } else {
                if let indexToRemove = selectedIndices.firstIndex(of: index) {
                    selectedIndices.remove(at: indexToRemove)
                }
            }
        } else {
            deselectAllCards()
        }
    }
    
    private var areThreeCardsSelected: Bool {
        return self.selectedIndices.count == 3
    }
    
    private func areCardsASet(_ first: Card, _ second: Card, _ third: Card) -> Bool {
         let shapes: Set<CardShape> = [first.shape, second.shape, third.shape]
         let numbers: Set<Int> = [first.number, second.number, third.number]
         let colors: Set<CardColor> = [first.color, second.color, third.color]
         let shadings: Set<CardShading> = [first.shading, second.shading, third.shading]

         return shapes.count != 2 && numbers.count != 2 && colors.count != 2 && shadings.count != 2
     }
    
    private var areSelectedCardsASet: Bool {
        let first = cards[selectedIndices[0]]
        let second = cards[selectedIndices[1]]
        let third = cards[selectedIndices[2]]

        return areCardsASet(first, second, third)
    }
    
    mutating private func deselectAllCards() {
         for i in selectedIndices {
             cards[i].isSelected = false
             cards[i].isMatched = cards[i].isMatched == true ? true : nil
             cards[i].isHidden = cards[i].isMatched == true ? true : false
         }

         selectedIndices.removeAll()
     }
    
    mutating private func reduceNumberOfVisibleCards() {
        if self.numberOfCardsToShow > Model.defaultNumberOfCardsToShow {
            self.numberOfCardsToShow -= 3
        }
    }
    
    mutating private func markSelectedCardsAsMatched() {
            if self.selectedIndices.count != 3 {
                return
            }

            for i in selectedIndices {
                cards[i].isMatched = true
            }
        }

        mutating private func markSelectedCardsAsNotMatched() {
            if self.selectedIndices.count != 3 {
                return
            }

            for i in selectedIndices {
                cards[i].isMatched = false
            }
        }

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
 //   private(set) var cards: Array<Card>
    
 //   private var indexOfTheOneAndOnlyFaceUpCard: Int? {
 //       get {cards.indices.filter({ cards[$0].isFaceUp}).oneAndOnly}
 //       set{
 //           cards.indices.forEach{cards[$0].isFaceUp = ($0 == newValue)}
 //
 //       }
 //   }
    
   // mutating  func choose(_ card: Card) {
        //if let chosenIndex = index(of: card) {
   //     if let chosenIndex = cards.firstIndex(where: {$0.id == card.id}),
   //        !cards[chosenIndex].isFaceUp,
   //        !cards[chosenIndex].isMatched {
   //         if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
   //             if cards[chosenIndex].content == cards[potentialMatchIndex].content {
   //                 cards[chosenIndex].isMatched = true
   //                 cards[potentialMatchIndex].isMatched = true
   //             }
   //             cards[chosenIndex].isFaceUp = true
   //
   //         } else {
   //             indexOfTheOneAndOnlyFaceUpCard = chosenIndex
   //         }
   //
   //     }
   //     print("\(cards)")
   // }
    
 //   init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
 //       cards = []
 //       for pairIndex in 0..<numberOfPairsOfCards {
 //           let content = createCardContent(pairIndex)
 //           cards.append(Card(content: content, id: pairIndex*2))
 //           cards.append(Card(content: content, id: pairIndex*2+1))
 //       }
 //   }
    
//    struct Card: Identifiable {
//        var isFaceUp = false
//        var isMatched = false
//        let content: CardContent
//        let id: Int
//    }
//}

//extension Array {
 //   var oneAndOnly: Element? {
//        if count == 1 {
//            return first
//        }
    
//        else {
//            return nil
//        }
//    }
}
