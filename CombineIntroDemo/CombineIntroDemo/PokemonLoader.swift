//
//  PokemonLoader.swift
//  CombineIntroDemo
//
//  Created by Pedro Rojas on 04/05/21.
//

import Combine
import Foundation

class PokemonLoader: ObservableObject {
    @Published var pokemonData: [Pokemon] = []
    @Published var isLoading = false

    private var cancellable: AnyCancellable?
    private let urlSession = URLSession(configuration: .default)
    private let url = URL(string: "https://pokeapi.co/api/v2/pokemon/?limit=151")!

    func load() {
        isLoading = true
        cancellable = urlSession
            .dataTaskPublisher(for: url)
            .tryMap() { element -> Data in
                guard let httpResponse = element.response as? HTTPURLResponse,
                      httpResponse.statusCode == 200
                else {
                    throw URLError(.badServerResponse)
                }
                return element.data
            }
            .decode(type: PokemonResponse.self, decoder: JSONDecoder())
            .receive(on: RunLoop.main)
            .sink(
                receiveCompletion: { [weak self] in
                    guard let self = self else { return }
                    self.isLoading = false
                    print ("Received completion: \($0).")
                },
                receiveValue: { [weak self] response in
                    guard let self = self else { return }
                    self.pokemonData = response
                        .results
                        .enumerated()
                        .map {
                            Pokemon(
                                prefix: "\($0 + 1)",
                                name: $1.name,
                                url: $1.url
                            )
                        }
                }
            )
    }
}

