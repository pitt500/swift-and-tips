import Foundation

// MARK: Hiding Private API

// without opaque types
//func transformToInt (array: [String]) -> LazyDropWhileSequence<LazyMapSequence<LazyFilterSequence<LazyMapSequence<LazySequence<[String]>.Elements, Int?>>, Int>> {
//    return array
//        .lazy
//        .compactMap { Int($0) }
//        .drop(while: { $0 < 10 })
//}

func transformToInt (array: [String]) -> some Sequence {
    return array
        .lazy
        .compactMap { Int($0) }
        .drop(while: { $0 < 10 })
}

let values = transformToInt(array: ["1", "2", "20", "Pitt"])
for value in values {
    print(value, terminator: " ")
}



protocol Stack {
    associatedtype Element

    var count: Int { get }
    mutating func push(_ element: Element)
    mutating func pop() -> Element?
}

struct MyStack<Item>: Stack {
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


// MARK: Returning protocols with associated types & reverse generics
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

//var stack6: MyStack<Int> = merge(&stack4, &stack5) // error!, you cannot force the type
var stack6 = merge(&stack4, &stack5)

print("-----")
while let value = stack6.pop() {
    print("\(value)", terminator: " ")
}

print(type(of: stack6))




// MARK: Protocols vs Opaque Types
protocol Animal {}

struct Dog: Animal {}
struct Cat: Animal {}

func adoptPet() -> some Animal {
    Cat()
}

// Error: Function declares an opaque return type,
// but the return statements in its body do not have matching underlying types
//func randomPet() -> some Animal {
//    if Bool.random() {
//        return Dog()
//    }
//
//    return Cat()
//}

func randomPet() -> Animal {
    if Bool.random() {
        return Dog()
    }

    return Cat()
}

print(type(of: adoptPet()))
