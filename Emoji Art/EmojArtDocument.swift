//
//  EmojArtDocument.swift
//  Emoji Art
//
//  Created by Вадим on 24.04.2024.
//

import SwiftUI

class EmojArtDocument: ObservableObject {
    typealias Emoji = EmojiArt.Emoji
    @Published
    private var emojiArt = EmojiArt() {
        didSet {
            autosave()
        }
    }
    
    init() {
        if let data = try? Data(contentsOf: autosaveURL),
           let autisavedEmojiArt = try? EmojiArt(json: data) {
            emojiArt = autisavedEmojiArt
        }
    }
    
    private let autosaveURL: URL = URL.documentsDirectory.appendingPathComponent("Autosaved.emojiart")
    
    private func autosave() {
        save(to: autosaveURL)
        print("autosaved to \(autosaveURL)")
    }
    
    private func save(to url: URL) {
        do {
            let data = try emojiArt.json()
            try data.write(to: url)
        } catch let error {
            print("EmojiArtDocument: error while saving \(error.localizedDescription)")
        }
        
    }
    
    var emojis: [Emoji] {
        emojiArt.emojis
    }
    
    var backdround: URL? {
        emojiArt.background
    }
    
    //MARK: - Intent(s)
    
    func setBackground(_ url: URL?) {
        emojiArt.background = url
    }
    
    func addEmoji(_ emoji: String, at position: Emoji.Position, size: CGFloat) {
        emojiArt.addEmoji(emoji, at: position, size: Int(size))
    }
}

extension EmojiArt.Emoji {
    var font: Font {
        Font.system(size: CGFloat(size))
    }
}

extension EmojiArt.Emoji.Position {
    func `in`(_ geometry: GeometryProxy) -> CGPoint {
        let center = geometry.frame(in: .local).center
        return CGPoint(
            x: center.x + CGFloat(x),
            y: center.y - CGFloat(y)
        )
    }
}
