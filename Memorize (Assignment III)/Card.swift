//
//  Card.swift
//  Memorize (Assignment III)
//
//  Created by Carmen Morado on 9/19/21.
//

import Foundation

struct Card: Identifiable, Equatable {
    let id = UUID()
    let shape: CardShape
    let number: Int
    let color: CardColor
    let shading: CardShading
    var isSelected: Bool = false
    var isMatched: Bool?
    var isHidden: Bool = false
    var isHint: Bool = false

 //   static func == (lhs: Card, rhs: Card) -> Bool {
 //       return lhs.id == rhs.id
 //   }
}

enum CardShape: CaseIterable {
    case diamond
    case oval
    case squiggle
}

enum CardShading: CaseIterable {
    case solid
    case striped
    case outlined
}

enum CardColor: CaseIterable {
    case red
    case purple
    case green
}
