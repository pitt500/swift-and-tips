import Foundation
/*
 Acoording to the documentation, Protocol is a "blueprint" of methods, properties,
 and other requirements that suit a particular task or piece of functionality.

 Protocols can be adopted by classes, structs or enums. Any type that "satisfies"
 the requirements is said to conforms to that protocol.
*/


// MARK: - First Protocol
protocol FirstProtocol {

}

protocol AnotherProtocol {

}

//Cannot inherit from another struct, but allowed many protocol inheritance
struct MyStruct: FirstProtocol, AnotherProtocol {

}

class MyClass: NSObject, FirstProtocol, AnotherProtocol {

}

// MARK: - Property Requirements

// The protocol doesn't specify that property could be a stored or computer property.
// It only specifies the name, type and if it's gettable or settable.

// Constants and computer properties cannot be settable.

//As any type in Swift, start with Capital letter
protocol Player {
    // all should be var always
    var name: String { get set }
    var score: Int { get }
    var nickname: String { get }

    static var numberOfPlayers: Int { get set }
}

struct Person: Player {
    //property names should match with protocol declaration
    var name: String
    var score: Int

    var nickname: String {
        return "Pitt"
    }

    static var numberOfPlayers = 1
}

var person = Person(name: "Pitt", score: 500)
person.name =  "Pedro" // Valid
person.score = 140 // Valid too, because Person's score is editable.


// MARK: - Method Requirements

protocol Stack {
    var count: Int { get }

    // No curly braces nor body
    // Use mutating for value types modification.
    mutating func push(_ element: Int)
    mutating func pop() -> Int?
}

struct MyStack: Stack {
    private var values: [Int] = []
    var count: Int {
        values.count
    }

    //Mutating keywork is not required for classes
    mutating func push(_ element: Int) {
        values.append(element)
    }

    mutating func pop() -> Int? {
        values.popLast()
    }
}

class MyStack2: Stack {
    private var values: [Int] = []
    var count: Int {
        values.count
    }

    func push(_ element: Int) {
        values.append(element)
    }

    func pop() -> Int? {
        values.popLast()
    }
}

// Enums
protocol Toggable {
    mutating func toggle()
}

enum OnOffSwitch: Toggable {
    case on
    case off

    mutating func toggle() {
        switch self {
        case .on:
            self = .off
        case .off:
            self = .on
        }
    }
}

//MARK: - Initializers
protocol Loggable {
    init(filename: String)
    func log()
}

class Logger: Loggable {
    private var filename = ""

    // Required is needed for subclass conforming protocol too.
    // Unless class is marked as final
    required init(filename: String) {
        self.filename = filename
    }

    func log() {
        print("I'm watching you!")
    }
}

// MARK: - Protocols as Types
// "There exists a type T such that T conforms to the protocol"

// As parameter type or return type in a function
func printPlayer(player: Player) {
    print("\(player.nickname) has joined the match!")
}

class ListOfPlayers {
    // As collection
    let players: [Player]

    init(_ players: [Player]) {
        self.players = players
    }

    //As variable
    private var latestTopPlayer: Player?

    func getTopPlayer() -> Player? {

        guard let top = players.sorted(by: { $0.score > $1.score }).first
        else { return nil }

        latestTopPlayer = top
        return top
    }

}

struct SoccerPlayer: Player {
    var name: String
    var score: Int
    var nickname: String

    static var numberOfPlayers: Int = 1

    var jerseyNumber: Int

}

//Players will hide jerseyNumber value unless you do a casting
let players: [Player] = [
    Person(name: "Pitt", score: 500),
    SoccerPlayer(
        name: "Messi",
        score: 700,
        nickname: "La Pulga",
        jerseyNumber: 10
    )
]

// ⚠️ This is evaluated at runtime. If type doesn't match this line will crash! ⚠️
let soccerPlayer = players[1] as! SoccerPlayer

let listOfPlayers = ListOfPlayers(players)
print(listOfPlayers.getTopPlayer()?.nickname ?? "No players")

for player in players {
    print("Name: \(player.name), Score: \(player.score)")
}


// MARK: - Protocol as Extension

extension SoccerPlayer: Comparable {
    static func < (lhs: SoccerPlayer, rhs: SoccerPlayer) -> Bool {
        return lhs.score < rhs.score
    }
}

let messi = SoccerPlayer(
    name: "Lionel Messi",
    score: 740,
    nickname: "La Pulga",
    jerseyNumber: 10
)

let cr7 = SoccerPlayer(
    name: "Cristiano Ronaldo",
    score: 730,
    nickname: "CR7",
    jerseyNumber: 7
)

if cr7 > messi {
    print("CR7 is the best player")
} else {
    print("Messi is the best player")
}

// MARK: - Class only protocols

protocol ClassOnly: AnyObject {
    func onlyClassMethod()
}

class AnotherClass: ClassOnly {
    func onlyClassMethod() {
        print("I'm a class")
    }
}

// will produce an error
//struct AnotherStruct: ClassOnly {}


// MARK: - Protocol Composition
// Conforming multiple protocols at the same time

typealias ManyProtocols = Player & Loggable & FirstProtocol

struct LoggerPlayer: ManyProtocols {
    var name = "Logger Player"
    var score = 0
    var nickname = "LP"

    static var numberOfPlayers: Int = 1

    init(filename: String) {
        print("Save player here: \(filename)")
    }

    func log() {
        print("Hello Player")
    }
}

// MARK: - Optional Protocols (Objc)
// In Swift all properties and methods are required!

// Only classes can conform objc protocols
@objc protocol ObjcCounter {
    //marked as optional automatically
    @objc optional var count: Int { get set }
    @objc optional func printCounter()
}

class MyCounter: ObjcCounter {
    func printCounter() {
        print("Hello Counter")
    }
}

let counter = MyCounter()
counter.printCounter()

// This line will throw an error from compiler
// count doesn't exist in MyCounter
//print(counter.count)

// To get the actual value from protocol, you must cast
print((counter as ObjcCounter).count)


// MARK: - Default Protocols (better approach)

protocol Counter {
    var count: Int { get set }
    func printCounter()
}

extension Counter {
    func printCounter() {
        print("DefaultMessage")
    }
}

struct NewCounter: Counter {
    var count: Int = 10
}

let newCounter = NewCounter()
newCounter.printCounter()

// Just be careful here and don't abuse. Optional protocols could be forgotten because compiler won't complain.
