//: [Previous](@previous)

import Foundation

enum DemoError: Error {
    case randomError
}

func someProcess(completion: () -> Void, failure: (DemoError) -> Void) {
    let isEverythingOk = Bool.random()

    if isEverythingOk {
        completion()
    } else {
        failure(.randomError)
    }
}

func someProcess(completion: () -> Void) {
    completion()
}

/// Trailing closure is a special syntax for closures at the end of your function that can be written (for the last one)
/// after the function's parenthesis.

// MARK: - A ✅
//(Recommended by https://github.com/raywenderlich/swift-style-guide#closure-expressions)
someProcess(
    completion: {
        print("Success!")
    },
    failure: { error in
        print("Error: \(error)")
    }
)

// MARK: - B
someProcess {
    print("Success!")
} failure: { error in
    print("Error: \(error)")
}

// MARK: - C
someProcess(
    completion: {
        print("Success!")
    }
) { error in
    print("Error: \(error)")
}

// MARK: - D ✅
//(Recommended by https://github.com/raywenderlich/swift-style-guide#closure-expressions)
someProcess {
    print("Success!")
}

// MARK: - E
someProcess(completion: {
    print("Success!")
})




//: [Next](@next)
