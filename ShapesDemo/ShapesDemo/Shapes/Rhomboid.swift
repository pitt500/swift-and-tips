//
//  Rhomboid.swift
//  ShapesDemo
//
//  Created by Pedro Rojas on 23/02/22.
//

import SwiftUI

struct Rhomboid: View {
    let size: CGFloat
    
    var body: some View {
        HStack(spacing: 0) {
            Triangle()
                .rotationEffect(Angle(degrees: 270))
                .frame(width: size, height: size)
                
            Triangle()
                .rotationEffect(Angle(degrees: 90))
                .frame(width: size, height: size)
        }
    }
}

struct Rhomboid_Previews: PreviewProvider {
    static var previews: some View {
        Rhomboid(size: 100)
    }
}
