//
//  CardDetailView.swift
//  FlashCards
//
//  Created by Joe Sokolosky on 5/3/24.
//

import SwiftData
import SwiftfulRouting
import SwiftUI

struct CardDetailView: View {
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    @Environment(\.router) private var router
    
    @Bindable var deck: CardDeck
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.cardLightGray.ignoresSafeArea().opacity(0.8)
                
                VStack(spacing: 10) {
                    HStack(spacing: 0) {
                        TextField("", text: $deck.name)
                         
                        Text(" Card Deck")
                         
                    }
                    .padding(.horizontal, 60)
                    .font(.title)
                    
                    Divider()
                    
                    Divider()

                    Spacer()
                }
            }
        }
    
    }
}

//#Preview {
//    RouterView { _ in
//        CardDetailView()
//    }
//}
