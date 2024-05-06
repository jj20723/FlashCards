//
//  DeckInfoView.swift
//  FlashCards
//
//  Created by Joe Sokolosky on 5/2/24.
//

import SwiftData
import SwiftfulRouting
import SwiftUI

struct DeckInfoView: View {
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    @Environment(\.router) private var router
    
    @State private var addingDeck = false
    @State private var name: String = ""
    
    var decks: [CardDeck]
    
    var body: some View {
        ZStack {
            Color.cardLightYellow.ignoresSafeArea()
            
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
 
                    .onTapGesture {
                        router.showScreen(.fullScreenCover) { _ in
                            CardDetailView(deck: deck)
                        }
                    }
                    
                }
                .onDelete { indexSet in
                    indexSet.forEach { index in
                        let deck = decks[index]
                        context.delete(deck)
                    }
                }
                
            }
            .listStyle(.plain)
            
        }
    }
}

//#Preview {
//    DeckInfoView()
//}
