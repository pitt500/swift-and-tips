//: [Previous](@previous)

import Foundation

func combineWords() -> (String) -> String {
    var string = ""

    return { word in
        string += word
        return string
    }
}

// Closures are reference types 💡
let x: (String) -> String = combineWords()
let y = x

let resultX = x("Hello")
let resultY = y("Goodbye")

print(resultY)


//: [Next](@next)
