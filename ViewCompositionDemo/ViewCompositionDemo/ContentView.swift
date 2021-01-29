//
//  ContentView.swift
//  ViewCompositionDemo
//
//  Created by Pedro Rojas on 28/01/21.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel: PlayerViewModel
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            LinearGradient(
                gradient: Gradient(
                    colors: [
                        viewModel.media.color.opacity(0.6),
                        viewModel.media.color.opacity(0.3)
                    ]
                ),
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            
            VStack(alignment: .center) {

                HStack(alignment: .top) {
                    Image(systemName: "chevron.down")
                        .foregroundColor(.white)
                        .font(
                            .system(
                                size: 20,
                                weight: .regular,
                                design: .default
                            )
                        )

                    Spacer()
                    Text(viewModel.media.artist)
                        .foregroundColor(.white)
                        .font(
                            .system(
                                size: 15,
                                weight: .bold,
                                design: .default
                            )
                        )
                    Spacer()
                    Image(systemName: "ellipsis")
                        .foregroundColor(.white)
                        .font(
                            .system(
                                size: 20,
                                weight: .bold,
                                design: .default
                            )
                        )

                }
                .frame(minHeight: 0, maxHeight: 100)


                Spacer()

                Image(viewModel.media.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(minHeight: 150, maxHeight: 300, alignment: .center)
                    .padding(.bottom, 30)
                
                VStack (alignment: .leading) {
                    Text(viewModel.media.name)
                        .foregroundColor(.white)
                        .font(
                            .system(
                                size: 30,
                                weight: .bold,
                                design: .default
                            )
                        )

                    Text(viewModel.media.artist)
                        .foregroundColor(Color.white.opacity(0.8))
                        .font(.callout)

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

                    Spacer()
                    HStack (alignment: .bottom){
                        Image(systemName: "tv.and.hifispeaker.fill")
                        Spacer()
                        Image(systemName: "list.triangle")
                    }
                    .foregroundColor(.white)


                }
            }.padding([.leading, .trailing, .bottom])
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(
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
