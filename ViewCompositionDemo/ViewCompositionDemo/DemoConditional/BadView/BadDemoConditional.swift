//
//  DemoList.swift
//  ViewCompositionDemo
//
//  Created by Pedro Rojas on 29/01/21.
//

import SwiftUI

struct BadDemoConditional: View {
    @State var isEmpty = false

    var body: some View {
        VStack {
            if isEmpty {
                VStack {
                    Text("Data couldn't be loaded")
                    Image(systemName: "xmark.seal.fill")
                        .resizable()
                        .frame(width: 100, height: 100)
                }
                .frame(maxHeight: .infinity)
            } else {
                ZStack {
                    ZStack {
                        Color.black
                        Color.blue.opacity(0.8)
                    }
                    .ignoresSafeArea()
                    VStack {
                        Image("mario")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 150, height: 150)
                            .clipped()
                            .cornerRadius(75)

                        Text("Mario Bros.")
                            .foregroundColor(.white)
                            .font(.largeTitle)
                        Text("mbros@nintendo.com")
                            .foregroundColor(.white)
                            .font(.callout)

                    }
                    .shadow(radius: 30 )
                }
            }

            //Just for demo
            Toggle("Change View", isOn: $isEmpty)
                .frame(width: 180, height: 40)
        }
    }
}

struct BadDemoConditional_Previews: PreviewProvider {
    static var previews: some View {
        BadDemoConditional(isEmpty: false)
    }
}
