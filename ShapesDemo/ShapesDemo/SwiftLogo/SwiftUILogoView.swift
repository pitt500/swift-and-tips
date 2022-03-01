//
//  SwiftUILogoView.swift
//  ShapesDemo
//
//  Created by Pedro Rojas on 01/03/22.
//

import SwiftUI

struct SwiftUILogoView: View {
    var body: some View {
        GeometryReader { proxy in
            let size = min(proxy.size.width, proxy.size.height) * 0.1
            
            ZStack {
                RoundedRectangle(cornerRadius: size)
                    .fill(
                        LinearGradient(
                            colors: [
                                Color(red: 0.0/255, green: 32.0/255, blue: 152.0/255),
                                Color(red: 0.0/255, green: 244.0/255, blue: 247.0/255)
                            ],
                            startPoint: .bottomTrailing,
                            endPoint: .topLeading
                        )
                    )
                SwiftLogo()
                    .fill(.black)
                    .padding(size*1.5)
            }
            
        }
        .aspectRatio(1, contentMode: .fit)
    }
}

struct SwiftUILogoView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUILogoView()
            .padding(100)
    }
}
