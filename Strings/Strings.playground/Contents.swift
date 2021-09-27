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


// MARK: - Workaround with Array of characters

func isPalindromeWorkaround(_ s: String) -> Bool {
    let string = s
        .filter { $0.isNumber || $0.isLetter }
        .lowercased()
    let word = [Character](string)
    if word.count == 0 { return true }

    var startIndex = 0
    var endIndex = word.count - 1

    while startIndex < endIndex {

        if word[startIndex] != word[endIndex] {
            return false
        }

        startIndex += 1
        endIndex -= 1
    }

    return true
}

print(isPalindromeWorkaround("maam"))





// MARK: - Characters in a String
let string = "Pizza 🍕"
for character in string {
    print(type(of: character))
}






// MARK: - Better version of isPalindrome:
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

print(isPalindrome2("Ma, 1, a    m"))


let letterE: Character = "\u{65}"
let acute: Character = "\u{301}"
let combinedEAcute: Character = "\u{65}\u{301}"



let man = "\u{1F468}"
let woman = "\u{1F469}"
let boy = "\u{1f466}"
let girl = "\u{1F467}"
let zeroWidthJoiner = "\u{200D}"
let family = "\u{1F468}\u{200D}\u{1F469}\u{200D}\u{1f467}\u{200D}\u{1F466}"

let family2 = "👨‍👩‍👧‍👦"
let scalars = Array(family2.unicodeScalars).map { $0.value }

print(scalars)




let numberOfCharacters = "Hello 🌎".count
print(numberOfCharacters)
