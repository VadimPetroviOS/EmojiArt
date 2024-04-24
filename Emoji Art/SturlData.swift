//
//  SturlData.swift
//  Emoji Art
//
//  Created by Вадим on 24.04.2024.
//

import CoreTransferable

enum SturlData: Transferable {
    case string(String)
    case url(URL)
    case data(Data)
    
    init(url: URL) {
//        if let imageData = url.dataSchemeImageData {
//            self = .data(imageData)
//        } else {
            self = .url(url)
//        }
    }
    
    init(string: String) {
        if string.hasPrefix("http"), let url = URL(string: string) {
            self = .url(url)
        } else {
            self = .string(string)
        }
    }
    
    static var transferRepresentation: some TransferRepresentation {
        ProxyRepresentation {SturlData(string: $0) }
        ProxyRepresentation {SturlData(url: $0) }
//        ProxyRepresentation {SturlData(data: $0) }
    }
}
