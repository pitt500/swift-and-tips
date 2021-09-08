import Foundation

// MARK: - Problems that Key Path solves

struct Person {
    let name: String
    let age: Int
}

var person1 = Person(name: "Pitt", age: 25)
var person2 = Person(name: "John", age: 43)
var person3 = Person(name: "Steve", age: 32)

let people = [person1, person2, person3]

let names = people.map(\.name)//people.map { $0.name }

print(names)



// MARK: - The anatomy of a key path

let nameProperty = \Person.name

let names2 = people.map { $0[keyPath: nameProperty] }
print(names2)
