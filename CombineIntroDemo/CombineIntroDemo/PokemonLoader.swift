//
//  PokemonLoader.swift
//  CombineIntroDemo
//
//  Created by Pedro Rojas on 04/05/21.
//

import Combine
import Foundation

enum PokemonError: Error, Identifiable {
    case serverError
    case noData

    var id: Self {
        self
    }
}

class PokemonLoader: ObservableObject {
    @Published var pokemonData: [Pokemon] = []
    @Published var isLoading = false
    @Published var error = false

    private var cancellable: AnyCancellable?
    private let urlSession = URLSession(configuration: .default)
    private let url = URL(string: "https://pokeapi.co/api/v2/pokemon/?limit=151")!

    func load() {
        isLoading = true
        cancellable = urlSession
            .dataTaskPublisher(for: url)
            .tryMap { output in
                guard let response = output.response as? HTTPURLResponse, response.statusCode == 200 else {
                    throw PokemonError.serverError
                }
                return output.data
            }
            .decode(type: PokemonResponse.self, decoder: JSONDecoder())
            .map(\.results)
            .map { self.addIds(to: $0) }
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: { [weak self] completion in
                    guard let self = self else { return }
                    self.isLoading = false
                    switch completion {
                    case .finished:
                        self.error = false
                        break
                    case .failure(let error):
                        print(error)
                        self.error = true
                    }
                },
                receiveValue: { [weak self] response in
                    guard let self = self else { return }
                    self.pokemonData = response
                }
            )
    }

    func loadImperative(
        completion: @escaping (Result<[Pokemon], PokemonError>) -> Void
    ) {
        urlSession.dataTask(with: url) { [weak self] (data, response, error) in
            guard let self = self else { return }

            guard let response = response as? HTTPURLResponse, response.statusCode == 200
            else {
                completion(.failure(.serverError))
                return
            }


            guard let data = data
            else {
                completion(.failure(.noData))
                return
            }

            let decoder = JSONDecoder()

            guard let decodedData =
                    try? decoder
                    .decode(PokemonResponse.self, from: data)
            else {
                completion(.failure(.noData))
                return
            }

            let pokemonList = self.addIds(to: decodedData.results)


            completion(.success(pokemonList))
            return
        }
        .resume()
    }

    func addIds(to pkmnList: [Pokemon]) -> [Pokemon] {
        var pokemonWithIds = pkmnList

        for index in 0..<pkmnList.count {
            pokemonWithIds[index].prefix = "\(index + 1)"
        }

        return pokemonWithIds
    }
}

