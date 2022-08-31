//
//  PlanetButtonView.swift
//  RickAndMorty
//
//  Created by Васлий Николаев on 31.08.2022.
//

import SwiftUI

struct PlanetButtonView: View {
    @State var isSelect: Bool = false
    @Binding var selected: TabBarButton

    var body: some View {
        VStack {
            Image("planet")
                .resizable()
                .frame(width: 28, height: 28)
                .rotationEffect(isSelect ? Angle(degrees: 180) : .zero)
                .scaleEffect(isSelect ? 0.8 : 1)
            Text("Location")
                .font(.footnote)
        }
        .foregroundColor(selected == .planet ? .cyan : .gray)
        .onTapGesture {
            let animation = Animation.easeInOut(duration: 0.25).repeatCount(1, autoreverses: true)
            selected = .planet
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
