//: [Previous](@previous)

import Foundation





// MARK: - A
func sayHello(to name: String) {
    print("Hello \(name)!")
}
sayHello(to: "Swift and Tips")


// MARK: - B
func calculateAverage(_ array: [Int]) -> Int {
    var result = 0

    func average() -> Int {
        for value in array {
            result += value
        }

        return result/array.count
    }

    return average()
}
print(calculateAverage([1, 2, 3]))


// MARK: - C
let add = { (a: Int, b: Int) in
    return a + b
}
print(add(3,2))






//: [Next](@next)
