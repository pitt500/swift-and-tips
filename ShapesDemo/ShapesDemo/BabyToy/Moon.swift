//
//  Moon.swift
//  ShapesDemo
//
//  Created by Pedro Rojas on 25/02/22.
//

import SwiftUI

struct Moon: Shape {
    func path(in rect: CGRect) -> Path {
//        var path = Path()
//
//
//
//        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
//        path.addQuadCurve(
//            to: CGPoint(x: rect.midX, y: rect.maxY),
//            control: CGPoint(x: 0, y: rect.midY)
//        )
//
//        path.addArc(
//            center: CGPoint(x: rect.midX, y: rect.midY),
//            radius: rect.width / 2,
//            startAngle: .degrees(-90),
//            endAngle: .degrees(90),
//            clockwise: true
//        )
        
        var path = Rectangle().path(in: rect)
        path.addPath(
            Circle().path(
                in: rect.offsetBy(dx: 100, dy: -10)
            )
        )
        
        
        return path
    }
}

struct Moon_Previews: PreviewProvider {
    static var previews: some View {
//        Moon()
//            .fill(.blue)
        Circle()
            .mask(
                Moon().fill(style: FillStyle(eoFill: true))
            )

            .foregroundColor(.yellow)
            .padding()
            .background(.black)
        
//        Circle()
//            .mask(
//                Moon()
//                    //.stroke(.blue, lineWidth: 3)
//                    .foregroundColor(.blue)
//                    .aspectRatio(1, contentMode: .fit)
//                    .padding()
//            )


            
        
    }
}
