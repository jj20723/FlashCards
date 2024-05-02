//
//  AddDeck.swift
//  FlashCards
//
//  Created by Joe Sokolosky on 5/2/24.
//

import SwiftUI

struct AddDeckView: View {
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    
    @State private var name: String = ""
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Add New Flashcard Deck")
                .font(.title2)
                .fontWeight(.medium)
            
            TextField("Deck Name", text: $name)
            
            HStack(spacing: 40) {
                Button {
                    if !name.isEmpty {
                        let newDeck = CardDeck(name: name)
                        context.insert(newDeck)
                        dismiss()
                    }
                } label: {
                    Text("Save Deck")
                }
                .disabled(name.isEmpty)
                
                Button {
                    dismiss()
                } label: {
                    Text("Cancel")
                }
            }
            .padding(.horizontal, 10)
            .buttonStyle(.bordered)
        }
        .padding()
    }
}

#Preview {
    AddDeckView()
}
