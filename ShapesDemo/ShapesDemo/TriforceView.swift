//
//  ContentView.swift
//  ShapesDemo
//
//  Created by Pedro Rojas on 23/02/22.
//

import SwiftUI

struct Triangle: Shape {
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

struct TriforcePiece: View {
    private let size: CGFloat = 150
    
    var body: some View {
        Triangle()
            .fill(
                LinearGradient(
                    colors: [.yellow, .yellow.opacity(0.7)],
                    startPoint: .center,
                    endPoint: .bottom))
            .frame(width: size, height: size)
    }
}

struct TriforceView: View {
    
    var body: some View {
        ZStack {
            Color.black
            .ignoresSafeArea()
            
            VStack {
                TriforcePiece()
                HStack {
                    TriforcePiece()
                    TriforcePiece()
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
