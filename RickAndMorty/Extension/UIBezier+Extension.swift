//
//  UIBezier+Extension.swift
//  RickAndMorty
//
//  Created by Васлий Николаев on 30.08.2022.
//

import Foundation
import UIKit

extension UIBezierPath {
    static func calculateBounds(paths: [UIBezierPath]) -> CGRect {
        let myPath = UIBezierPath()
        for path in paths {
            myPath.append(path)
        }
        return myPath.bounds
    }

    static var boo: UIBezierPath {
        let shape = UIBezierPath()
        shape.move(to: CGPoint(x: 9.09, y: 0))
        shape.addCurve(to: CGPoint(x: 0, y: 9), controlPoint1: CGPoint(x: 4.08, y: 0), controlPoint2: CGPoint(x: 0, y: 4.04))
        shape.addLine(to: CGPoint(x: 0.05, y: 17))
        shape.addCurve(to: CGPoint(x: 3.54, y: 20), controlPoint1: CGPoint(x: 0.3, y: 18.69), controlPoint2: CGPoint(x: 1.76, y: 20))
        shape.addCurve(to: CGPoint(x: 6.23, y: 18.83), controlPoint1: CGPoint(x: 4.72, y: 20), controlPoint2: CGPoint(x: 5.63, y: 19.58))
        shape.addCurve(to: CGPoint(x: 7.55, y: 19.7), controlPoint1: CGPoint(x: 6.61, y: 19.2), controlPoint2: CGPoint(x: 7.06, y: 19.5))
        shape.addCurve(to: CGPoint(x: 9.1, y: 20), controlPoint1: CGPoint(x: 8.04, y: 19.9), controlPoint2: CGPoint(x: 8.57, y: 20))
        shape.addCurve(to: CGPoint(x: 10.65, y: 19.69), controlPoint1: CGPoint(x: 9.63, y: 20), controlPoint2: CGPoint(x: 10.16, y: 19.89))
        shape.addCurve(to: CGPoint(x: 11.96, y: 18.81), controlPoint1: CGPoint(x: 11.14, y: 19.49), controlPoint2: CGPoint(x: 11.59, y: 19.19))
        shape.addCurve(to: CGPoint(x: 14.65, y: 20), controlPoint1: CGPoint(x: 12.57, y: 19.57), controlPoint2: CGPoint(x: 13.48, y: 20))
        shape.addCurve(to: CGPoint(x: 18.18, y: 16.5), controlPoint1: CGPoint(x: 16.6, y: 20), controlPoint2: CGPoint(x: 18.18, y: 18.43))
        shape.addLine(to: CGPoint(x: 18.18, y: 9))
        shape.addCurve(to: CGPoint(x: 9.09, y: 0), controlPoint1: CGPoint(x: 18.18, y: 4.04), controlPoint2: CGPoint(x: 14.1, y: 0))
        shape.close()
        return shape
    }
}
