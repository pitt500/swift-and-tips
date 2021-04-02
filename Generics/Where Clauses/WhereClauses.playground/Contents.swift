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


// MARK: - Where clause
// Enable you to define requirements on the type parameters for generic functions, types,
// and associated types.

func insert<Container: Stack>(
    structure: inout Container
) where Container.Element == Int {
    structure.push(1)
}

func insert<Container: Stack, Value>(
    structure: inout Container,
    value: Value
) where Container.Element == Value {
    structure.push(value)
}

insert(structure: &stack2, value: 10)
print(stack2.pop() ?? "Empty")


// MARK: - Extensions with Where Clauses (Contextual Where clauses)

extension MyStack where Element: Equatable {
    func isOnTop(_ value: Element) -> Bool {
        guard let last = values.last else {
            return false
        }

        // Referencing operator function '==' on 'Equatable'
        // requires that 'MyStack<Item>.Element' (aka 'Item') conform to 'Equatable'
        return value == last
    }
}

print(stack3.isOnTop("Everybody!"))
print(stack3.isOnTop("Hello"))

extension MyStack where Element == Int {
    func average() -> Double {
        var sum = 0.0

        for value in values {
            sum += Double(value)
        }

        return sum/Double(values.count)
    }
}

print(stack2.average())

//print(stack3.average) // You can't use average in the incorrect context ❌


// MARK: - Challenge: Merge two stacks
func merge<Container1: Stack, Container2: Stack>(
    _ c1: inout Container1,
    _ c2: inout Container2
) -> some Stack where Container1.Element == Container2.Element {
    var newContainer = MyStack<Container1.Element>()

    while let value = c1.pop() {
        newContainer.push(value)
    }

    while let value = c2.pop() {
        newContainer.push(value)
    }

    return newContainer
}

var stack4 = MyStack<Int>()
stack4.push(5)
stack4.push(8)
stack4.push(13)

var stack5 = MyStack<Int>()
stack5.push(1)
stack5.push(2)
stack5.push(3)

var stack6 = merge(&stack4, &stack5)

print("-----")
while let value = stack6.pop() {
    print("\(value)", terminator: " ")
}

