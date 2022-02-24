//
//  TangramView.swift
//  ShapesDemo
//
//  Created by Pedro Rojas on 23/02/22.
//

import SwiftUI

struct TangramView: View {
    
    private let size: CGFloat = 200
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                Triangle()
                    .fill(.blue)
                    .rotationEffect(Angle(degrees: 270))
                    .frame(width: size*2, height: size*2)
                    
                Triangle()
                    .fill(.orange)
                    .frame(width: size*2, height: size*2)
            }
            
            HStack(spacing: 0) {

                Triangle()
                    .fill(.pink)
                    .rotationEffect(Angle(degrees: 180))
                    .frame(width: size, height: size)
                    
                Rectangle()
                    .fill(.yellow)
                    .frame(width: size, height: size)
                
                Triangle()
                    .fill(.purple)
                    .rotationEffect(Angle(degrees: 90))
                    .frame(width: size, height: size)
                
                Rhomboid()
                    .frame(width: size*2, height: size)
                    .offset(x: -(size/2))
                    .frame(width: size)
                    .foregroundColor(.green)
            }
            
            HStack(spacing: 0) {
                Triangle()
                    .fill(.red)
                    .rotationEffect(Angle(degrees: 315))
                    .frame(width: size*1.41, height: size*1.41)
                    .offset(x: 0, y: -(size*1.41)/2)
            }
        }
        .rotationEffect(Angle(degrees: -45))
    }
}

struct TangramView_Previews: PreviewProvider {
    static var previews: some View {
        TangramView()
    }
}
