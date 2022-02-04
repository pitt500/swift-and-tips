//
//  ImageDetailView.swift
//  MagnificationGestureDemo
//
//  Created by Pedro Rojas on 04/02/22.
//

import SwiftUI

struct ImageDetailView: View {
    let image: Image
    
    var body: some View {
        image
            .resizable()
            .aspectRatio(contentMode: .fit)
    }
}

struct ImageDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ImageDetailView(image: Image("1"))
    }
}
