import Foundation

// MARK: - Associated Types
// Placeholder name to a type that is used as part of a protocol.
// The actual type for the associated type isn't specified until the protocol is adopted.
// Use associatedtype keyword

/* // error ❌
protocol Stack<T> {
    var count: Int { get }
    mutating func push(_ element: Int)
    mutating func pop() -> Int?
}
*/

protocol Stack {
    // We need a way to name our type without knowing anything about "specific" Element type.
    associatedtype Element

    var count: Int { get }
    mutating func push(_ element: Element)
    mutating func pop() -> Element?
}

struct IntStack: Stack {
    private var values: [Int] = []

    // Optional once Element can be inferred
    typealias Element = Int

    var count: Int {
        values.count
    }

    mutating func push(_ element: Int) {
        values.append(element)
    }

    mutating func pop() -> Int? {
        values.popLast()
    }
}

var stack1 = IntStack()
stack1.push(1)
stack1.push(2)
stack1.push(3)


// MARK: - Generic Type using a protocol with associated type

struct MyStack<Item>: Stack {
    // Optional once Element can be inferred
    typealias Element = Item

    private var values: [Item] = []

    var count: Int {
        return values.count
    }

    mutating func push(_ element: Item) {
        values.append(element)
    }

    mutating func pop() -> Item? {
        values.popLast()
    }
}


var stack2 = MyStack<Int>()
stack2.push(1)
stack2.push(2)
stack2.push(3)

var stack3 = MyStack<String>()
stack3.push("Hello")
stack3.push("World")
stack3.push("Everybody!")


// MARK: - Extending from a protocol with associated types

extension Array: Stack {
    // Did you notice that associated type was inferred because placeholder type has the same name
    // like Array's one?

    mutating func push(_ element: Element) {
        self.append(element)
    }

    mutating func pop() -> Element? {
        self.popLast()
    }
}



// MARK: - How to solve "Protocol 'Stack' can only be used as a generic constraint ..."?
//func executeOperation(stack: Stack) {  // error ❌
//
//}

// Correct way to use protocols with associated types ✅
func executeOperation<Container: Stack>(container: Container) {

}

