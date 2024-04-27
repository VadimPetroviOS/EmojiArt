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
    var defaultDocument = EmojiArtDocument()
    @StateObject
    var paletteStore = PaletteStore(named: "Main")
    @StateObject
    var store2 = PaletteStore(named: "Alternate")
    @StateObject
    var store3 = PaletteStore(named: "Special")

    var body: some Scene {
        WindowGroup {
//            .environmentObject(paletteStore)
        }
    }
}
