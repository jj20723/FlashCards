//
//  Card.swift
//  FlashCards
//
//  Created by Joe Sokolosky on 5/2/24.
//

import Foundation
import SwiftData

@Model
class Card {
    let id = UUID().uuidString
    var front: String
    var back: String
    var image: Data?
    var cardDeck: CardDeck?
    
    init(front: String, back: String, image: Data? = nil) {
        self.front = front
        self.back = back
        self.image = image
    }
}
