//
//  ControlMediaView.swift
//  ViewCompositionDemo
//
//  Created by Pedro Rojas on 29/01/21.
//

import SwiftUI

struct ControlMediaView: View {
    @ObservedObject var viewModel: PlayerViewModel

    var body: some View {
        VStack {
            HStack {
                Image(systemName: "shuffle")
                    .foregroundColor(Color.white.opacity(0.7))
                Spacer()
                Button(
                    action: { viewModel.backward() },
                    label: {
                        Image(systemName: "backward.end.fill")
                            .resizable()
                            .foregroundColor(.white)
                            .frame(width: 30, height: 30)
                    }
                )
                Spacer()
                Button(
                    action: { viewModel.play() },
                    label: {
                        Image(systemName: viewModel.isPlaying ? "play.circle.fill" : "pause.circle.fill")
                            .resizable()
                            .foregroundColor(.white)
                            .frame(width: 80, height: 80)
                    }
                )
                Spacer()
                Button(
                    action: { viewModel.forward() },
                    label: {
                        Image(systemName: "forward.end.fill")
                            .resizable()
                            .foregroundColor(.white)
                            .frame(width: 30, height: 30)
                    }
                )
                Spacer()
                Image(systemName: "repeat")
                    .foregroundColor(Color.white.opacity(0.7))
            }
            .frame(maxHeight: .infinity)
        }
    }
}

struct ControlMediaView_Previews: PreviewProvider {
    static var previews: some View {
        ControlMediaView(
            viewModel: .init(media: Media.demo)
        )
    }
}
