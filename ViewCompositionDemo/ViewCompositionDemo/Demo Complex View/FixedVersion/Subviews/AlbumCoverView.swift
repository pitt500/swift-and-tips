//
//  AlbumCoverView.swift
//  ViewCompositionDemo
//
//  Created by Pedro Rojas on 29/01/21.
//

import SwiftUI

struct AlbumCoverView: View {
    let media: Media

    var body: some View {
        Image(media.imageName)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(minHeight: 150, maxHeight: 300, alignment: .center)
            .padding(.bottom, 30)
    }
}

struct AlbumCoverView_Previews: PreviewProvider {
    static var previews: some View {
        AlbumCoverView(imageName: "queen")
    }
}
