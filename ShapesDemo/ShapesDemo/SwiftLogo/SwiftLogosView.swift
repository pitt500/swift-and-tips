//
//  SwiftLogosView.swift
//  ShapesDemo
//
//  Created by Pedro Rojas on 01/03/22.
//

import SwiftUI

struct SwiftLogosView: View {
    var body: some View {
        HStack {
            SwiftLogoView()
                .padding(50)
            SwiftUILogoView()
                .padding(50)
        }
    }
}

struct SwiftLogosView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftLogosView()
            .previewInterfaceOrientation(.landscapeRight)
    }
}
