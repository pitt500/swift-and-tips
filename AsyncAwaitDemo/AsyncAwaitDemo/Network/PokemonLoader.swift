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
    private let limit = 20
    private var offset = 0

    func combineLoad() {
        let url = URL(string: "https://pokeapi.co/api/v2/pokemon/?limit=\(limit)&offset=\(offset)")!

        cancellable = urlSession
            .dataTaskPublisher(for: url)
            .tryMap { output in
                guard (output.response as? HTTPURLResponse)?.statusCode == 200
                else { throw PokemonError.serverError }

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

        guard let decoded = try? JSONDecoder().decode(PokemonResponse.self, from: data)
        else { throw PokemonError.noData }

        await updateList(newData: decoded.results)
    }

    @MainActor func updateList(newData: [Pokemon]) {
        print(newData.map(\.name))
        self.pokemonData = newData.reversed() + self.pokemonData
        self.offset += self.limit
    }

    func closureLoad(completion: @escaping (Result<[Pokemon], Error>) -> Void) {
        let url = URL(string: "https://pokeapi.co/api/v2/pokemon/?limit=\(limit)&offset=\(offset)")!
        let task = URLSession.shared.dataTask(with: url) { data, response, error in

            if let error = error {
                //We cannot throw an error in this completion handler!
                completion(.failure(error))
            } else if (response as? HTTPURLResponse)?.statusCode != 200 {
                //We cannot throw an error in this completion handler!
                completion(.failure(PokemonError.serverError))
            } else {
                guard let data = data
                else {
                    completion(.failure(PokemonError.noData))
                    return
                }

                guard let pokemonResponse = try? JSONDecoder().decode(PokemonResponse.self, from: data)
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
}



