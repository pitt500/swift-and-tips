//: [Previous](@previous)

import Foundation



func executeOperation() -> (Int) -> Int {
    var value = 0

    return { anotherValue in
        value += anotherValue
        return value
    }
}

let operation = executeOperation()
let x = operation(10)
let y = operation(12)
let z = operation(8)

print(z)



//: [Next](@next)
