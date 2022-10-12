//
//  CharacterCardView.swift
//  RickAndMorty
//
//  Created by Васлий Николаев on 08.09.2022.
//

import SwiftUI

struct CharacterCardView: View {
    //Constants
    let delay: Double = 0.17
    let startingOffset = 550.0

    @State var rotation: Double = 0
    @State var zIndex: Double = 0
    @State var dragTranslation: CGSize = CGSize(width: 0, height: 550)
    @Binding var topCard: Int

    let cardStackSize: Int
    let color: Color
    let text: String
    let index: Int

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .foregroundColor(color)
            Text(text)
        }
        .frame(width: 320, height: 220)
        .rotationEffect(.degrees(rotation))
        .scaleEffect(sizeScale(topCard: topCard, index: index))
        .position(x: UIScreen.main.bounds.width / 2, y: dragTranslation.height)
        .zIndex(zIndex)
        .offset(y: offsetScale(topCard: topCard, index: index))
        .animation(.spring(), value: topCard)
        .gesture(drag)
        .allowsHitTesting(topCard == index)
    }
}

private extension CharacterCardView {
    func linearScale(inputMin: CGFloat, inputMax: CGFloat, outputMin: CGFloat, outputMax: CGFloat, value: CGFloat) -> CGFloat {
        return outputMin + (outputMax - outputMin) * (value - inputMin) / (inputMax - inputMin)
    }

    func rotationalScale(value: CGFloat) -> CGFloat {
        return round(linearScale(inputMin: 0, inputMax: 1, outputMin: 0, outputMax: 3, value: value))
    }

    func locationScale(value: CGFloat) -> CGFloat {
        return linearScale(inputMin: 0, inputMax: 1, outputMin: -500, outputMax: 300, value: value)
    }

    func offsetScale(topCard: Int, index: Int) -> CGFloat {
        let position = getPosition(for: index, topCard: topCard) + 1
        return linearScale(inputMin: 1, inputMax: CGFloat(cardStackSize), outputMin: 100, outputMax: 0, value: CGFloat(position))
    }

    func sizeScale(topCard: Int, index: Int) -> CGFloat {
        let position = getPosition(for: index, topCard: topCard) + 1
        return linearScale(inputMin: 0.0, inputMax: 4.0, outputMin: 0.7, outputMax: 1, value: CGFloat(cardStackSize - position))
    }

    func getPosition(for card: Int, topCard: Int) -> Int {
        let order = calculateCardPositionInStack(topCard: topCard)
        guard let position = order.firstIndex(of: card) else { return .zero }
        return position
    }

    func calculateCardPositionInStack(topCard: Int) -> [Int] {
        return (topCard...topCard+cardStackSize).compactMap {
            let i = $0 % (cardStackSize+1); return i < 1 ? nil : i
        }
    }

    var drag: some Gesture {
        return DragGesture()
            .onChanged { gesture in
                dragTranslation.height = gesture.translation.height + startingOffset
            }
            .onEnded { gesture in
                let predictedEndTranslation: Double = gesture.predictedEndTranslation.height
                let velocity = abs(predictedEndTranslation - gesture.translation.height) / 1500
                var shouldRotate = velocity > 0.1

                if predictedEndTranslation <= -250 {
                    if topCard < cardStackSize {
                        topCard += 1
                    } else {
                        topCard = 1
                    }

                    if shouldRotate {
                        withAnimation(.easeOut(duration: delay)) {
                            dragTranslation.height = locationScale(value: 1 - velocity)
                            rotation -= rotationalScale(value: velocity) * 180
                        }
                    }

                    DispatchQueue.main.asyncAfter(deadline: shouldRotate ? .now() + delay : .now()) {
                        zIndex -= 1
                    }

                    withAnimation(.spring().delay(shouldRotate ? delay : .zero)) {
                        dragTranslation.height = startingOffset
                        rotation -= shouldRotate ? rotationalScale(value: velocity) * 180 : .zero
                    }
                } else {
                    withAnimation(.spring()) {
                        dragTranslation.height = startingOffset
                    }
                }
            }
    }
}
