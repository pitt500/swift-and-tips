import Foundation

// MARK: - Problems that Key Path solves

struct Person {
    var name: String
    let age: Int
}

var person1 = Person(name: "Pitt", age: 25)
var person2 = Person(name: "John", age: 43)
var person3 = Person(name: "Steve", age: 32)

let people = [person1, person2, person3]

let names = people.map(\.name)//people.map { $0.name }

print(names)



// MARK: - The anatomy of a key path

let nameProperty: KeyPath<Person, String> = \.name

let names2 = people.map { $0[keyPath: nameProperty] }
print(names2)









import SwiftUI

// MARK: - SwiftUI Identifiable

struct ContentView: View {
    var body: some View {
        List {
            ForEach(names, id: \.self) { name in
                Text("\(name)")
            }
        }
    }
}











// MARK: - Types of key paths

func uppercased<T>(object: inout T, keypath: WritableKeyPath<T, String>) {
    object[keyPath: keypath] = object[keyPath: keypath].uppercased()
}

uppercased(object: &person1, keypath: \Person.name)
print(person1.name)

var aCEO = "Tim Apple"

uppercased(object: &aCEO, keypath: \String.self)
print(aCEO)




// MARK: - ReferenceWritableKeypath

class AnotherPerson {
    var name: String
    let age: Int

    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

var another = AnotherPerson(name: "Bill", age: 50)

let structKeypath = \Person.name
let classKeyPath = \AnotherPerson.name

uppercased(object: &another, keypath: classKeyPath)
print(another.name)










// MARK: - PartialKeyPath

let keyPathName = \Person.name
let keyPathAge = \Person.age

let keyPathList = [keyPathName, keyPathAge]

for keyPath in keyPathList {
    print(person2[keyPath: keyPath])
}


// MARK: - AnyKeyPath
let classKeyPathName = \AnotherPerson.name
let classKeyPathAge = \AnotherPerson.age

let keyPathList2 = [keyPathName, keyPathAge, classKeyPathName, classKeyPathAge]

for keyPath in keyPathList2 {
    if let keyPath = keyPath as? PartialKeyPath<Person> {
        print(person1[keyPath: keyPath])
    } else if let keyPath = keyPath as? PartialKeyPath<AnotherPerson> {
        print(another[keyPath: keyPath])
    }
}
