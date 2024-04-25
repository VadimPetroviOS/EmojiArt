//
//  Emoji_ArtApp.swift
//  Emoji Art
//
//  Created by Вадим on 24.04.2024.
//

import SwiftUI

@main
struct Emoji_ArtApp: App {
    @StateObject
    var defaultDocument = EmojArtDocument()
    
    @StateObject
    var paletteStore = PaletteStore(name: "Main")
    
    var body: some Scene {
        WindowGroup {
            EmojiArtDocumentView(document: defaultDocument)
                .environmentObject(paletteStore)
        }
    }
}
