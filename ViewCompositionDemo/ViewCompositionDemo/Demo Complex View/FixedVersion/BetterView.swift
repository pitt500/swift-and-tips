//
//  BetterView.swift
//  ViewCompositionDemo
//
//  Created by Pedro Rojas on 29/01/21.
//

import SwiftUI

struct BetterView: View {
    @StateObject var viewModel: PlayerViewModel

    var body: some View {
        ZStack {
            BackgroundView(color: viewModel.media.color)

            VStack {

                HeaderView(title: viewModel.media.artist)
                Spacer()

                AlbumCoverView(media: viewModel.media)

                VStack (alignment: .leading) {
                    MediaInfoView(media: viewModel.media)

                    TrackProgressView(viewModel: viewModel)

                    ControlMediaView(viewModel: viewModel)
                    Spacer()
                    DevicesAndMoreView()
                }
            }.padding([.leading, .trailing, .bottom])
        }
    }
}

struct BetterView_Previews: PreviewProvider {
    static var previews: some View {
        BetterView(
            viewModel: .init(
                media: Media.demo
            )
        )
    }
}

