//
//  PaletteManager.swift
//  Emoji Art
//
//  Created by Вадим on 27.04.2024.
//

import SwiftUI

struct PaletteManager: View {
    let stores: [PaletteStore]
    
    @State
    var selectedStore: PaletteStore?
    
    var body: some View {
        NavigationSplitView {
            List(stores, selection: $selectedStore) { store in
                PaletteStoreView(store: store)
                    .tag(store)
            }
        } content: {
            if let selectedStore {
                EditablePaletteList(store: selectedStore)
            }
            Text("Choose a store")
        } detail: {
            Text("Choose a palette")
        }
    }
}

struct PaletteStoreView: View {
    @ObservedObject
    var store: PaletteStore
    
    var body: some View {
        Text(store.name)
    }
}

struct PaletteManager_Previews: PreviewProvider {
    static var previews: some View {
        PaletteManager(stores: [PaletteStore(named: "Preview1"),PaletteStore(named: "Preview2")])
    }
}
