import UIKit

// The problem that generics solve:

// MARK: - Duplicating code even for simple tasks like "saying hello"...
func sayHello(toInt value: Int) {
    print("Hello World \(value)!")
}

func sayHello(toString value: String) {
    print("Hello World \(value)!")
}

func sayHelloDouble(toDouble value: Double) {
    print("Hello World \(value)!")
}

func sayHelloFloat(toFloat value: Float) {
    print("Hello World \(value)!")
}

// MARK: - Generic Functions & Type Parameters
func sayHello<T>(to value: T) {
    print("Hello World \(value)!")
}

sayHello(to: 4)
sayHello(to: "String")
sayHello(to: Double.pi)


// MARK: - What about use Any for everything?
// This example could fit the requirement...
func sayHelloAny(to value: Any) {
    print("Hello World \(value)!")
}

// But the usage of Any has big tradeoffs: Performance & Casting
// Compiler can figure out the right amount of memory for the concrete type,
// Instead, Any wraps the actual value and creating additional memory.

let anyArray: Array<Any> = [1, "Bonjour", 5.9, {}]

print(anyArray[0] as! Int)
//print(anyArray[1] as! Int) // Boom! 💥


// MARK: - Type Constraint

func addInt(a: Int, b: Int) -> Int {
    return a + b
}

func add<T: Numeric>(a: T, b: T) -> T {
    return a + b
}

print(add(a: 3, b: 4))
print(add(a: 3.4, b: 4.6))
print(add(a: 3, b: 4.7))
// print(add(a: "hello", b: "world")) Error ❌: Requires to conforms Numeric protocol!



// MARK: - Generic Types

struct StackInt {
    private var values: [Int] = []

    mutating func push(_ value: Int) {
        values.append(value)
    }

    mutating func pop() -> Int? {
        values.popLast()
    }
}

struct Stack<Element> {
    private var values: [Element] = []

    mutating func push(_ value: Element) {
        values.append(value)
    }

    mutating func pop() -> Element? {
        values.popLast()
    }
}


var stacksOfInts = Stack<Int>()
stacksOfInts.push(1)
stacksOfInts.push(2)
stacksOfInts.push(3)

var stacksOfStrings = Stack<String>()
stacksOfStrings.push("Articuno")
stacksOfStrings.push("Zapdos")
stacksOfStrings.push("Moltres")


// MARK: - Extending a generic type

//Generic type is available in the extension
extension Stack {
    var lastPushed: Element? {
        values.last
    }
}

print(stacksOfStrings.lastPushed ?? "Empty")
