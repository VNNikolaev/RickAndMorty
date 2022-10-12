//
//  CharacterView.swift
//  RickAndMorty
//
//  Created by Васлий Николаев on 01.09.2022.
//

import SwiftUI

struct CharacterView: View {
    @State private var characters: [Characters] = .charactersMok
    @State private var topCard = 1

    var body: some View {
        ZStack {
            ForEach(characters) {
                CharacterCardView(
                    topCard: $topCard,
                    cardStackSize: characters.count,
                    color: $0.color,
                    text: $0.name,
                    index: $0.id
                )
            }
        }
    }
}
