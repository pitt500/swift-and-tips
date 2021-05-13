import Foundation

struct Post: Codable {
    // A simple property wrapper help you
    // to decode/encode your dates :)!
    @ISO8601Date var date: Date
    
    var title: String
    var description: String
    var urlImage: URL?
}

let post = Post(
    date: Date(),
    title: "Hello World",
    description: "This is just a test",
    urlImage: nil
)

@propertyWrapper
struct ISO8601Date: Codable {
    private(set) var wrappedValue: Date

    init(wrappedValue: Date) {
        self.wrappedValue = wrappedValue
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let stringDate = try container.decode(String.self)

        if let date = ISO8601DateFormatter().date(from: stringDate) {
            wrappedValue = date
        } else {
            throw DecodingError.typeMismatch(Date.self, DecodingError.Context(codingPath: [], debugDescription: "Invalid date format!"))
        }
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        let string = ISO8601DateFormatter().string(from: wrappedValue)
        try container.encode(string)
    }
}

// Test
let encoder = JSONEncoder()
let decoder = JSONDecoder()

let data = try encoder.encode(post)
let jsonString = String(data: data, encoding: .utf8)!
print("JSON: \(jsonString)")

let samePost = try decoder.decode(Post.self, from: data)
print("Post Object: \(samePost)")
