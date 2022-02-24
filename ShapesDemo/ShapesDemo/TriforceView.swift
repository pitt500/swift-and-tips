//
//  ContentView.swift
//  ShapesDemo
//
//  Created by Pedro Rojas on 23/02/22.
//

import SwiftUI

struct Triforce: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(
            to: CGPoint(x: rect.midX, y: rect.minY)
        )
        
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        return path
    }
}

struct TriforceView: View {
    @State var angle = Angle(degrees: 0.0)
    
    var rotation: some Gesture {
        RotationGesture()
            .onChanged { state in
                angle = state
            }
    }
    
    var body: some View {
        ZStack {
            Color.black
            .ignoresSafeArea()
            
            VStack {
                ZStack {
                    Triforce()
                        .fill(
                            LinearGradient(
                                colors: [.yellow.opacity(0.7), .yellow],
                                startPoint: .top,
                                endPoint: .center))
                        .rotationEffect(angle)
                        .gesture(rotation)
                }
                .frame(width: 200, height: 200)
                
                HStack {
                    ForEach(1...2, id: \.self) { _ in
                        Triforce()
                            .fill(
                                LinearGradient(
                                    colors: [.yellow, .yellow.opacity(0.7)],
                                    startPoint: .center,
                                    endPoint: .bottom))
                            .rotationEffect(angle)
                            .gesture(rotation)
                            .frame(width: 200, height: 200)
                    }
                }
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TriforceView()
    }
}
