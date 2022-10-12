//
//  Character.swift
//  RickAndMorty
//
//  Created by Васлий Николаев on 12.10.2022.
//

import Foundation
import SwiftUI

struct Characters: Identifiable {
    let id: Int
    let name: String
    let color: Color
}

extension Array where Element == Characters {
    static let charactersMok: [Element] = [
        .init(
            id: 6,
            name: "Rick",
            color: .green
        ),
        .init(
            id: 5,
            name: "Morty",
            color: .red
        ),
        .init(
            id: 4,
            name: "Summer",
            color: .yellow
        ),
        .init(
            id: 3,
            name: "Bed",
            color: .blue
        ),
        .init(
            id: 2,
            name: "Dad",
            color: .teal
        ),
        .init(
            id: 1,
            name: "12345",
            color: .orange
        )
    ]
}
