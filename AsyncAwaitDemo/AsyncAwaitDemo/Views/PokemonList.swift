import SwiftUI

struct PokemonList: View {
    @ObservedObject var loader: PokemonLoader
    private let imageWidth = 110.0
    private let cellHeight = 130.0

    var body: some View {

        List {
            ForEach(loader.pokemonData) { pokemon in
                AsyncImage(
                    url: pokemon.url,
                    scale: 1.0,
                    transaction: Transaction(animation: .easeIn(duration: 0.5))
                ) { phase in
                    switch phase {
                    case .success(let image):
                        HStack {
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: imageWidth)
                                .padding(.trailing, 10)
                            PokemonDescriptionView(pokemon: pokemon)
                            Spacer()
                        }
                    case .failure(let error):
                        ErrorView(error: error)
                    case .empty:
                        HStack {
                            ProgressView()
                                .progressViewStyle(CircularProgressViewStyle(tint: .red))
                            Spacer()
                        }
                    @unknown default:
                        // AsyncImagePhase is not marked as @frozen.
                        // We need to support new cases in the future.
                        Image(systemName: "questionmark")
                    }
                }
                .frame(maxWidth: .infinity)
                .frame(height: cellHeight)
                .padding()
                .listRowSeparator(.hidden)
            }
        }


    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonList(loader: PokemonLoader())
    }
}
