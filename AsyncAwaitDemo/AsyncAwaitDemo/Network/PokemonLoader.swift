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
    @Published var error = false

    private var cancellable: AnyCancellable?
    private let urlSession = URLSession(configuration: .default)
    private let limit = 3
    private var offset = 0

    func combineLoad() {
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
        let url = URL(string: "https://pokeapi.co/api/v2/pokemon/?limit=\(limit)&offset=\(offset)")!
        let (data, response) = try await URLSession.shared.data(from: url)

        guard (response as? HTTPURLResponse)?.statusCode == 200
        else { throw PokemonError.serverError }

        guard let decoded = try? self.decode(from: data, toType: PokemonResponse.self)
        else { throw PokemonError.noData }

        let list = decoded.results
        print(list.map(\.name))
        self.pokemonData = list.reversed() + self.pokemonData
        self.offset += self.limit
    }

    func closureLoad(completion: @escaping (Result<[Pokemon], Error>) -> Void) {
        let url = URL(string: "https://pokeapi.co/api/v2/pokemon/?limit=\(limit)&offset=\(offset)")!
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let self = self else { return }

            if let error = error {
                completion(.failure(error))
            } else if (response as? HTTPURLResponse)?.statusCode != 200 {
                completion(.failure(PokemonError.serverError))
            } else {
                guard let data = data
                else {
                    completion(.failure(PokemonError.noData))
                    return
                }

                guard let pokemonResponse = try? self.decode(from: data, toType: PokemonResponse.self)
                else {
                    completion(.failure(PokemonError.noData))
                    return
                }

                completion(.success(pokemonResponse.results))
            }
        }

        task.resume()
    }

    func load() async {
        // Look how much you need to do using closures:
//        closureLoad { [weak self] result in
//            guard let self = self else { return }
//
//            DispatchQueue.main.async {
//                switch result {
//                case .success(let list):
//                    self.pokemonData = list.reversed() + self.pokemonData
//                    self.offset += self.limit
//                case .failure(let error):
//                    print(error)
//                    self.error = true
//                }
//            }
//        }

        do {
            try await asyncLoad()
        } catch {
            print(error)
            self.error = true
        }
    }

    func decode<T: Decodable>(from data: Data, toType type: T.Type) throws -> T {
        guard let decoded = try? JSONDecoder().decode(type, from: data)
        else { throw PokemonError.noData }

        return decoded
    }
}



