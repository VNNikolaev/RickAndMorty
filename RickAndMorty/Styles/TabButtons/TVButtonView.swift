//
//  TVButtonView.swift
//  RickAndMorty
//
//  Created by Васлий Николаев on 31.08.2022.
//

import SwiftUI

struct TVButtonView: View {
    @State var isSelect: Bool = false
    @State var animateTVScreen: Bool = false
    @Binding var selected: TabBarButton

    var body: some View {
        VStack {
            Image("tv")
                .resizable()
                .frame(width: 28, height: 28)
                .overlay {
                    RoundedRectangle(cornerRadius: 2)
                        .foregroundColor(.white)
                        .frame(width: 19, height: screenHeight)
                        .offset(y: 2.75)
                }
                .scaleEffect(scaleEffect)
            Text("Episode")
                .font(.footnote)
        }
        .foregroundColor(foregroundColor)
        .onTapGesture { tapped() }
        .onChange(of: selected) { newValue in
            guard newValue != .tv else { return }
            withAnimation(.easeInOut(duration: 0.25)) {
                animateTVScreen = false
            }
        }
    }
}

private extension TVButtonView {
    var scaleEffect: CGFloat {
        isSelect ? 0.9 : 1
    }

    var foregroundColor: Color {
        selected == .tv ? .cyan : .gray
    }

    var screenHeight: CGFloat {
        animateTVScreen ? 13 : 0.001
    }

    func tapped() {
        let animation = Animation.easeInOut(duration: 0.25).repeatCount(1, autoreverses: true)
        selected = .tv
        animateTVScreen = false
        withAnimation(animation) {
            isSelect = true
            animateTVScreen = true
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
            withAnimation(animation) {
                self.isSelect = false
            }
        }
    }
}
