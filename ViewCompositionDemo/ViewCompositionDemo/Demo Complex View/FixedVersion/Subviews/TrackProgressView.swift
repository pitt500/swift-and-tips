//
//  TrackProgressView.swift
//  ViewCompositionDemo
//
//  Created by Pedro Rojas on 29/01/21.
//

import SwiftUI

struct TrackProgressView: View {
    @ObservedObject var viewModel: PlayerViewModel

    var body: some View {
        VStack {
            GeometryReader { geometry in
                ZStack(alignment: .leading){
                    Capsule()
                        .fill(Color.white.opacity(0.2))
                        .frame(width:geometry.size.width , height: 5)
                    Capsule()
                        .fill(Color.white)
                        .frame(width: viewModel.progressOffset, height: 5)
                    Circle()
                        .fill(Color.white)
                        .shadow(radius: 10)
                        .frame(width: 15, height: 15)
                        .offset(x: viewModel.progressOffset)
                        .gesture(DragGesture().onChanged(viewModel.onChange(_:)))
                }
            }
            .frame(height: 10)

            HStack {
                Text("0:00")
                Spacer()
                Text("-\(viewModel.durationInMinutes)")
            }
            .foregroundColor(.white)
            .font(.caption)
        }
    }
}

struct TrackProgressView_Previews: PreviewProvider {
    static var previews: some View {
        TrackProgressView(
            viewModel: .init(
                media: Media.demo
            )
        )
        .background(Color.red)
    }
}
