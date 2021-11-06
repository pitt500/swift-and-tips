import Foundation

// Variable 'x' used before being initialized
//var x: Int
//print(x)


// MARK: - What is actually an optional?

// Shorthand Syntax
var x: Int?
print(x)
print(type(of: x))

// Actual Optional Type
var y: Optional<Int>
print(type(of: y))

// MARK: - Optional is actually an enum!
/*
@frozen public enum Optional<Wrapped> : ExpressibleByNilLiteral {
    case some(Wrapped)
    case none
}
*/

// Nil is NOT a null pointer, it's just the representation
// of "abscence of value"

// Both are equivalent
x = 500
x = Optional.some(500)

// These two too:
x = nil
x = Optional.none
print(x)


// MARK: - Unwrapping
x = 500
y = 500

// Simple version
if x != nil {
    print("X is \(x)")
    //let xTenTimes = x * 10
}

// 1. Optional Binding:

if let x = x {
    print("X is \(x) and was unwrapped")
    let xTenTimes = x * 10
} else {
    print("X is nil")
}

// Pyramid of doom! - Use Guard let instead!
var anotherValue: Int? = 10
if let x = x {
    if let y = y {
        if let value = anotherValue {
            print(x, y, value)
        }
    }
}

// 2. Guard Let:
func printValues() {
    guard let x = x else {
        print("X is nil")
        return
    }

    guard let y = y  else {
        print("Y is nil")
        return
    }

    guard let value = anotherValue else {
        print("value is nil")
        return
    }
    print(x, y, value)
}

// 3. Switch:
switch x {
case .none:
    print("X is nil")
case .some(let x):
    print("X is \(x) and was unwrapped")
}


// MARK: - Functions can be optionals too!

func doSomething(completion: (() -> Void)?) {
    completion?()

    if completion == nil {
        print("Nothing sent in the completion")
    }
}

doSomething {
    print("Hello")
}

doSomething(completion: nil)


// MARK: - Optional Chaining
y = Int("hello") // will produce nil

let result = y.map({ "\($0)" })?.uppercased().reversed()
print(result)


// MARK: - Nil-Coalescing Operator
print(y ?? "No value")
let a: Int? = 10
let b = a ?? 0


// MARK: Force Unwrapping!

x = 40

print(x!)

// This will crash your app!!
//print(y!)

// You only must use force unwrapping under very specific
// circunstances where you are 100% sure the value will be there.

// Implicit unwrapped optionals

// When you cannot initialize your object at the start, but it will
// be ready once we need it.
var z: Int!

z = 10
print(z)
let isMultiple = z.isMultiple(of: 2)

z = nil
// this is fine!
print(z)

// This is bad!
let isMultiple2 = z.isMultiple(of: 2)
