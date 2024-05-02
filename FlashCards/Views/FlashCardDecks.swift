//
//  ContentView.swift
//  FlashCards
//
//  Created by Joe Sokolosky on 5/1/24.
//

import SwiftData
import SwiftUI

struct FlashCardDecks: View {
    @Environment(\.modelContext) private var context
    
    @Query(sort: \CardDeck.name) private var decks: [CardDeck]
    
    var body: some View {
        NavigationSplitView {
            DeckInfoView(decks: decks)
        } detail: {
            
        }

    }
}

#Preview {
    FlashCardDecks()
}
