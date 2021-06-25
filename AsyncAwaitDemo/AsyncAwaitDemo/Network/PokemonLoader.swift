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
    private let limit = 3
    private var offset = 0

    func load() {
        isLoading = true
        let url = URL(string: "https://pokeapi.co/api/v2/pokemon/?limit=\(limit)&offset=\(offset)")!

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
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] completion in
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
            },receiveValue: { [weak self] response in
                guard let self = self else { return }
                print(response.map(\.name))
                self.pokemonData = response.reversed() + self.pokemonData
                self.offset += self.limit
            })
    }
}



