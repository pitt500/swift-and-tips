import Foundation

func isPalindrome(_ s: String) -> Bool {
    let word = s
        .filter { $0.isNumber || $0.isLetter }
        .lowercased()
    /// count is expensive for strings, It must iterate over the unicode
    /// scalars in the entire string in other to determine the characters
    /// for that string!
    /// See more:
    /// https://docs.swift.org/swift-book/LanguageGuide/StringsAndCharacters.html#ID297
    if word.count == 0 { return true }

    var startIndex = 0
    var endIndex = word.count - 1

    while startIndex < endIndex {

        //Error: 'subscript(_:)' is unavailable: cannot subscript String with an Int, use a String.Index instead.
//        if word[startIndex] != word[endIndex] {
//            return false
//        }

        startIndex += 1
        endIndex -= 1
    }

    return true
}



// Better version:
func isPalindrome2(_ s: String) -> Bool {
    let word = s
        .filter { $0.isNumber || $0.isLetter }
        .lowercased()
    if word.isEmpty { return true }

    var startIndex = word.startIndex
    var endIndex = word.index(before: word.endIndex)

    while startIndex < endIndex {
        if word[startIndex] != word[endIndex] {
            return false
        }

        startIndex = word.index(after: startIndex)
        endIndex = word.index(before: endIndex)
    }

    return true
}

print(isPalindrome2("Ma, a, a    m"))
