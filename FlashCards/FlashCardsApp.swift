//
//  FlashCardsApp.swift
//  FlashCards
//
//  Created by Joe Sokolosky on 5/1/24.
//

import SwiftData
import SwiftUI

@main
struct FlashCardsApp: App {
    
    let container: ModelContainer
    
    var body: some Scene {
        WindowGroup {
            FlashCardDecks()
        }
        .modelContainer(container)
    }
    
    init() {
        let schema = Schema([CardDeck.self])
        let config = ModelConfiguration("FlashCards", schema: schema)
        
        do {
            container = try ModelContainer(for: schema, configurations: config)
        } catch {
            fatalError("Could not configure the container")
        }
        
        print(URL.applicationSupportDirectory.path(percentEncoded: false))
    }
}
