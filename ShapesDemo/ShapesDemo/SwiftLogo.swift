//
//  SwiftLogo.swift
//  ShapesDemo
//
//  Created by Pedro Rojas on 26/02/22.
//

import SwiftUI

struct SwiftLogo: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(
            to: CGPoint(
                x: rect.minX,
                y: rect.height * 0.63
            )
        )
        path.addCurve(
            to: CGPoint(x: rect.width * 0.98, y: rect.height * 0.98),
            control1: CGPoint(x: rect.width * 0.2, y: rect.height * 1.1),
            control2: CGPoint(x: rect.width * 0.9, y: rect.height*0.7)
        )
        
        path.addQuadCurve(
            to: CGPoint(x: rect.width * 0.9, y: rect.height * 0.7),
            control: CGPoint(x: rect.width * 1.1, y: rect.height * 0.85)
        )
        
        path.addQuadCurve(
            to: CGPoint(x: rect.width * 0.65, y: rect.minY),
            control: CGPoint(x: rect.width * 1.1, y: rect.height * 0.3)
        )
        
        path.addQuadCurve(
            to: CGPoint(x: rect.width * 0.7, y: rect.height * 0.6),
            control: CGPoint(x: rect.width * 0.9, y: rect.height * 0.3)
        )
        
        
        path.addQuadCurve(
            to: CGPoint(x: rect.width * 0.2, y: rect.height * 0.1),
            control: CGPoint(x: rect.width * 0.3, y: rect.height * 0.25)
        )
        
        path.addQuadCurve(
            to: CGPoint(x: rect.width * 0.47, y: rect.height * 0.55),
            control: CGPoint(x: rect.width * 0.25, y: rect.height * 0.25)
        )
        
        path.addQuadCurve(
            to: CGPoint(x: rect.width * 0.1, y: rect.height * 0.15),
            control: CGPoint(x: rect.width * 0.3, y: rect.height * 0.4)
        )
        
        path.addQuadCurve(
            to: CGPoint(x: rect.width * 0.5, y: rect.height * 0.7),
            control: CGPoint(x: rect.width * 0.30, y: rect.height * 0.51)
        )
        
        path.addQuadCurve(
            to: CGPoint(x: rect.minX, y: rect.height * 0.7),
            control: CGPoint(x: rect.width * 0.4, y: rect.height * 0.8)
        )
        
        
        return path
    }
}

struct SwiftLogo_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            SwiftLogo()
                .aspectRatio(1, contentMode: .fit)
            Image("swiftlogo")
                .resizable()
                .aspectRatio(1, contentMode: .fit)
                .opacity(0.4)
        }
    }
}
