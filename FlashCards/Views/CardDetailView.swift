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

                    TextField("", text: $deck.name)
                        .font(.title)
                        .frame(maxWidth: .infinity, alignment: .center)
                    
                    Divider()
                    
                    Divider()

                    Spacer()
                }
                .padding()
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Text("Cancel")
                    }
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
