import Foundation

// Full closure expression
[1, 2, 3].map(
    { (value: Int) -> String in
        return String(value)
    }
)

// value's type can be inferred
[1, 2, 3].map(
    { value -> String in
        return String(value)
    }
)

// closure's return type can be inferred
[1, 2, 3].map(
    { value in
        return String(value)
    }
)

// shorthand notation for arguments.
[1, 2, 3].map({ return String($0) })


// For single line expression, return can be omitted
[1, 2, 3].map({ String($0) })


