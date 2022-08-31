//
//  BooButtonView.swift
//  RickAndMorty
//
//  Created by Васлий Николаев on 30.08.2022.
//

import SwiftUI

struct BooButtonView: View {
    let pathBounds = UIBezierPath.calculateBounds(paths: [.boo])

    @State var isSelect: Bool = false
    @Binding var selected: TabBarButton

    var body: some View {
        VStack {
            ShapeView(bezier: .boo, pathBounds: pathBounds)
                .padding(.horizontal, 5)
                .padding(.vertical, 4)
                .frame(width: 28, height: 28)
                .overlay {
                    HStack(spacing: isSelect ? 0.5 : 2.5) {
                        Circle()
                            .foregroundColor(.white)
                            .frame(width: 4.44, height: isSelect ? 1 : 4.44)
                        Circle()
                            .foregroundColor(.white)
                            .frame(width: 4.44, height: isSelect ? 1 : 4.44)
                    }
                }
                .scaleEffect(isSelect ? 0.9 : 1)
            Text("Character")
                .font(.footnote)
        }
        .foregroundColor(selected == .boo ? .cyan : .gray)
        .onTapGesture {
            let animation = Animation.easeInOut(duration: 0.25).repeatCount(1, autoreverses: true)
            selected = .boo
            withAnimation(animation) {
                isSelect = true
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
                withAnimation(animation) {
                    self.isSelect = false
                }
            }
        }

    }
}
