//
//  ShapeView.swift
//  RickAndMorty
//
//  Created by Васлий Николаев on 30.08.2022.
//

import SwiftUI

struct ShapeView: Shape {
    let bezier: UIBezierPath
    let pathBounds: CGRect

    func path(in rect: CGRect) -> Path {
        let pointScale = (rect.width >= rect.height) ?
        max(pathBounds.height, pathBounds.width) :
        min(pathBounds.height, pathBounds.width)
        let pointTransform = CGAffineTransform(scaleX: 1/pointScale, y: 1/pointScale)
        let path = Path(bezier.cgPath).applying(pointTransform)
        let muliplier = min(rect.width, rect.height)
        let transform = CGAffineTransform(scaleX: muliplier, y: muliplier)
        return path.applying(transform)
    }
}
