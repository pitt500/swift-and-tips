//
//  HeaderView.swift
//  DragGesture_SwiftUI
//
//  Created by Pedro Rojas on 09/01/22.
//

import SwiftUI

struct HeaderView: View {
    let record: Double?
    let secondsElapsed: Double

    var body: some View {
        GeometryReader { proxy in
            VStack(alignment: .center) {
                Text("Drag and drop the shape in the correct place")
                if let record = record {
                    Text(String(format: "Record: %.1f seconds", record))
                }
                Text(String(format: "%.1f seconds", secondsElapsed))
            }
            .font(.largeTitle)
            .minimumScaleFactor(0.9)
            .position(x: proxy.size.width*0.5, y: proxy.size.height*0.15)
            .frame(width: proxy.size.width*0.8)
            .foregroundColor(.blue)
        }
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(record: 1.0, secondsElapsed: 2.0)
    }
}
