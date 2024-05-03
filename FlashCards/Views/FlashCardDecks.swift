//
//  ContentView.swift
//  FlashCards
//
//  Created by Joe Sokolosky on 5/1/24.
//

import SwiftData
import SwiftfulRouting
import SwiftUI

struct FlashCardDecks: View {
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    
    @State private var addingDeck = false
    @State private var name: String = ""
    
    @Query(sort: \CardDeck.name) private var decks: [CardDeck]
    
    var body: some View {
        ZStack {
            
            Color.cardLightGray.ignoresSafeArea()
            
            NavigationStack {
                VStack {
                    DeckInfoView(decks: decks)
                        .navigationTitle("Card Decks")
                        .navigationBarTitleDisplayMode(.automatic)
                }
                .toolbar {
                    Button {
                        addingDeck.toggle()
                    } label: {
                        Image(systemName: "plus.circle.fill")
                            .imageScale(.medium)
                    }
                }
                .alert("Add Deck Name", isPresented: $addingDeck) {
                    TextField("Deck Name", text: $name)
                    
                    HStack {
                        Button("Add Deck") {
                            if !name.isEmpty {
                                let deck = CardDeck(name: name)
                                context.insert(deck)
                                name = ""
                                dismiss()
                            }
                        }.disabled(name.isEmpty)
                        
                        Button("Cancel") {
                            name = ""
                            dismiss()
                        }
                    }
                    
                } message: {
                    Text("Add New Flashcard Deck")
                        .font(.title2)
                        .fontWeight(.medium)
                }
            }
            
            
        }

    }
}

#Preview {
    RouterView { _ in
        FlashCardDecks()
    }
}
