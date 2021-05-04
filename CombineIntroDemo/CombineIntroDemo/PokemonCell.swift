//
//  PokemonCell.swift
//  CombineIntroDemo
//
//  Created by Pedro Rojas on 04/05/21.
//

import SwiftUI

struct PokemonCell: View {
    let pokemon: Pokemon

    private var prefix: String {
        pokemon.prefix ?? ""
    }

    var body: some View {
        ZStack {
            Image(prefix + pokemon.name)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 200)
                .clipped()
            HStack(alignment: .top) {
                VStack(alignment: .leading) {
                    Text(pokemon.name.capitalized)
                        .font(Font.largeTitle.bold())
                        .foregroundColor(.white)
                        .padding(.bottom, 60)
                    Text("#\(prefix)")
                        .font(.system(size: 40))
                        .foregroundColor(.white)
                }
                Spacer()
            }
            .padding()
        }
    }
}

struct PokemonCell_Previews: PreviewProvider {
    static var previews: some View {
        PokemonCell(
            pokemon: Pokemon(
                prefix: "1",
                name: "bulbasaur",
                url: "123"
            )
        )
    }
}

