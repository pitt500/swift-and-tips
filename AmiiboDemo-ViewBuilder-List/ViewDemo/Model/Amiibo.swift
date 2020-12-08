
import Foundation

enum GameSeries {
    case zelda
    case mario
    case metroid
    case other
}

struct Amiibo: Identifiable {
    let id = UUID()
    let name: String
    let series: GameSeries
    let imageName: String
}

extension Amiibo {
    static let demo = [
        Amiibo(name: "Samus", series: .metroid, imageName: "samus"),
        Amiibo(name: "Link (Awakening)", series: .zelda, imageName: "link"),
        Amiibo(name: "Link (Ocarina)", series: .zelda, imageName: "linkOot"),
        Amiibo(name: "Young Link (Ocarina)", series: .zelda, imageName: "young_link"),
        Amiibo(name: "Koopa", series: .mario, imageName: "koopa"),
        Amiibo(name: "Yoshi", series: .mario, imageName: "yoshi"),
        Amiibo(name: "Waluigi", series: .mario, imageName: "waluigi"),
        Amiibo(name: "Snake", series: .other, imageName: "snake"),
    ]
}
