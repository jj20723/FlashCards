//
//  DeckInfoView.swift
//  FlashCards
//
//  Created by Joe Sokolosky on 5/2/24.
//

import SwiftData
import SwiftUI

struct DeckInfoView: View {
    @Environment(\.modelContext) private var context
    
    @State private var addingDeck = false
    
    var decks: [CardDeck]
    
    var body: some View {
        VStack(spacing: 10) {
            List {
                ForEach(decks) { deck in
                    HStack {
                        Text(deck.name)
                            .font(.title2)
                            .fontWeight(.medium)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Text("\(deck.cards?.count ?? 0) cards")
                            .font(.title3)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                    }
                    .navigationTitle("Flash Card Decks")
                }
                .onDelete { indexSet in
                    indexSet.forEach { index in
                        let deck = decks[index]
                        context.delete(deck)
                    }
                }
              
            }
            .listStyle(.plain)
            
            Button {
                addingDeck.toggle()
            } label: {
                Text("Add New Deck")
            }
            .buttonStyle(.borderedProminent)
            .sheet(isPresented: $addingDeck) {
                AddDeckView()
                    .presentationDetents([.medium])
            }
        }
    }
}

//#Preview {
//    DeckInfoView()
//}
