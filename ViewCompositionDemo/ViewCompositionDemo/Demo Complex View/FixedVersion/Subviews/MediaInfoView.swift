//
//  MediaInfoView.swift
//  ViewCompositionDemo
//
//  Created by Pedro Rojas on 29/01/21.
//

import SwiftUI

struct MediaInfoView: View {
    let media: Media

    var body: some View {
        VStack(alignment: .leading) {
            Text(media.name)
                .foregroundColor(.white)
                .font(
                    .system(
                        size: 30,
                        weight: .bold,
                        design: .default
                    )
                )

            Text(media.artist)
                .foregroundColor(Color.white.opacity(0.8))
                .font(.callout)
        }
    }
}

struct MediaInfoView_Previews: PreviewProvider {
    static var previews: some View {
        MediaInfoView(media: Media.demo)
            .background(Color.red)
            .previewLayout(.fixed(width: 300, height: 100))
    }
}
