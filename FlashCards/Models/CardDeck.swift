//
//  CardDeck.swift
//  FlashCards
//
//  Created by Joe Sokolosky on 5/2/24.
//

import Foundation
import SwiftData

@Model
class CardDeck {
    let id = UUID().uuidString
    var name: String
    @Relationship(deleteRule: .cascade)
    var cards: [Card]?
    

    
    init(name: String, cards: [Card]? = nil) {
        self.name = name
        self.cards = cards
    }
}
