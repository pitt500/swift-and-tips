//
//  Moon.swift
//  ShapesDemo
//
//  Created by Pedro Rojas on 25/02/22.
//

import SwiftUI

struct Moon: Shape {
    let control1: CGPoint
    let control2: CGPoint
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.width
        let height = rect.height
        let startPoint = CGPoint(x: width * 0.57, y: height * 0.1)
        
        path.move(to: startPoint)
        path.addCurve(
            to: CGPoint(x: width * 0.88, y: height * 0.56),
            control1: control1,
            control2: control2
        )
        
        path.addCurve(
            to: startPoint,
            control1: CGPoint(x: width * 0.52, y: height * 1.05),
            control2: CGPoint(x: width * 0.001, y: height * 0.3)
        )
        
        return path
    }
}


struct MoonView: View {
    
    @State var position1 = CGPoint(x: 50, y: 100)
    @State var position2 = CGPoint(x: 100, y: 200)
    
    var drag1: some Gesture {
        DragGesture()
            .onChanged { state in
                position1 = state.location
            }
            .onEnded { state in
                position1 = state.location
                print("Position1: \(position1)")
            }
    }
    
    var drag2: some Gesture {
        DragGesture()
            .onChanged { state in
                position2 = state.location
            }
            .onEnded { state in
                position2 = state.location
                print("Position22: \(position2)")
            }
    }
    
    var body: some View {
        ZStack {
            ZStack {
                Moon(control1: position1, control2: position2)
                    
                
                Circle()
                    .fill(.red)
                    .frame(width: 20, height: 20)
                    .position(position1)
                    .gesture(drag1)

                Circle()
                    .fill(.blue)
                    .frame(width: 20, height: 20)
                    .position(position2)
                    .gesture(drag2)
            }
        }
            .aspectRatio(1, contentMode: .fit)
            .frame(width: 400, height: 400)
    }
}


struct Moon_Previews: PreviewProvider {
    
    static var previews: some View {
        MoonView()
    }
}
