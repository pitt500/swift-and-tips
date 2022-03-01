//
//  SwiftLogoView.swift
//  ShapesDemo
//
//  Created by Pedro Rojas on 01/03/22.
//

import SwiftUI

struct SwiftLogoView: View {
    var body: some View {
        GeometryReader { proxy in
            let size = min(proxy.size.width, proxy.size.height) * 0.1
            
            ZStack {
                RoundedRectangle(cornerRadius: size)
                    .fill(
                        LinearGradient(
                            colors: [
                                Color(red: 253.0/255, green: 38.0/255, blue: 33.0/255),
                                Color(red: 248.0/255, green: 137.0/255, blue: 54.0/255)
                            ],
                            startPoint: .bottomTrailing,
                            endPoint: .topLeading
                        )
                    )
                SwiftLogo()
                    .fill(.white)
                    .padding(size*1.5)
            }
            
        }
        .aspectRatio(1, contentMode: .fit)
    }
}

struct SwiftLogoView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftLogoView()
            .padding(100)
    }
}
