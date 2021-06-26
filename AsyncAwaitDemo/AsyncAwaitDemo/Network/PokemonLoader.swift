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

    func combineLoad() {
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

    func asyncLoad() async throws {
        let url = URL(string: "https://pokeapi.co/api/v2/pokemonx/?limit=\(limit)&offset=\(offset)")!
        let (data, response) = try await URLSession.shared.data(from: url)
        guard (response as? HTTPURLResponse)?.statusCode == 200
        else { throw PokemonError.serverError }

        guard let decoded = try? JSONDecoder().decode(PokemonResponse.self, from: data)
        else { throw PokemonError.noData }

        let list = decoded.results
        print(list.map(\.name))
        self.pokemonData = list.reversed() + self.pokemonData
        self.offset += self.limit
    }

    func load() async {
        do {
            try await asyncLoad()
        } catch {
            print(error)
            self.error = true
        }
    }
}



