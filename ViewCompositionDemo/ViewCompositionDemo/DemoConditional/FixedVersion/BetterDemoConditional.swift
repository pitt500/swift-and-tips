//
//  BetterDemoConditional.swift
//  ViewCompositionDemo
//
//  Created by Pedro Rojas on 29/01/21.
//

import SwiftUI

struct Person {
    let name: String
    let imageName: String
    let email: String
}

struct BetterDemoConditional: View {
    @State private var isEmpty = false
    let person: Person

    var body: some View {
        VStack {
            if isEmpty {
                NoDataView()
            } else {
                ProfileView(person: person)
            }

            //Just for demo
            Toggle("Change View", isOn: $isEmpty)
                .frame(width: 180, height: 40)
        }
    }
}

struct BetterDemoConditional_Previews: PreviewProvider {
    static var previews: some View {
        BetterDemoConditional(
            person: Person(
                name: "Mario Bros.",
                imageName: "mario",
                email: "mbros@nintendo.com"
            )
        )
    }
}

struct NoDataView: View {
    var body: some View {
        VStack {
            Text("Data couldn't be loaded")
            Image(systemName: "xmark.seal.fill")
                .resizable()
                .frame(width: 100, height: 100)
        }
        .frame(maxHeight: .infinity)
    }
}

struct ProfileView: View {
    let person: Person

    var body: some View {
        ZStack {
            ZStack {
                Color.black
                Color.blue.opacity(0.8)
            }
            .ignoresSafeArea()
            VStack {
                Image(person.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 150, height: 150)
                    .clipped()
                    .cornerRadius(75)

                Text(person.name)
                    .foregroundColor(.white)
                    .font(.largeTitle)
                Text(person.email)
                    .foregroundColor(.white)
                    .font(.callout)

            }
            .shadow(radius: 30 )
        }
    }
}
