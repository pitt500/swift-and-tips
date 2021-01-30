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

                Image(viewModel.media.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(minHeight: 150, maxHeight: 300, alignment: .center)
                    .padding(.bottom, 30)

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
                media: Media(
                    name: "Bohemian Rhapsody",
                    artist: "Queen",
                    duration: 330000,
                    imageName: "queen",
                    color: .pink
                )
            )
        )
    }
}

