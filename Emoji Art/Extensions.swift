//
//  Extensions.swift
//  Emoji Art
//
//  Created by Вадим on 24.04.2024.
//

import Foundation

extension String {
    var uniqed: String {
        reduce(into: "") { sofar, element in
            if !sofar.contains(element) {
                sofar.append(element)
            }
        }
    }
}

extension CGRect {
    var center: CGPoint {
        CGPoint(x: midX, y: midY)
    }
    init(center: CGPoint, size: CGSize) {
        self.init(origin: CGPoint(x: center.x - size.width/2, y: center.y - size.height/2), size: size)
    }
}
