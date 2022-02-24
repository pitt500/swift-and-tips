//
//  Triangle.swift
//  ShapesDemo
//
//  Created by Pedro Rojas on 23/02/22.
//

import SwiftUI

struct TriangleSide: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(
            to: CGPoint(x: rect.minX, y: rect.minY)
        )
        
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        
        return path
    }
}

struct Triangle_Previews: PreviewProvider {
    static var previews: some View {
        TriangleSide()
    }
}
