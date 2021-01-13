import Foundation

// REFERENCE TYPE
class Shape {
    var x: Int = 0
    var y: Int = 0
}

class Square: Shape {
    deinit {
        print("free up memory here!")
    }
}

let square = Square()

print((square as Shape).x)
square.x.distance(to: 0).byteSwapped

class Person: Identifiable {
    let id = UUID().uuidString
    var firstName: String
    var lastName: String
    var age: Int
    var salary: Double
    
    init(
        firstName: String,
        lastName: String,
        age: Int,
        salary: Double
    ) {
        self.firstName = firstName
        self.lastName = lastName
        self.age = age
        self.salary = salary
    }
    
    func getFullName() -> String {
        return "\(firstName) \(lastName)"
    }
    
    subscript(index: Int) -> String {
        switch index {
        case 0:
            return firstName
        case 1:
            return lastName
        case 2:
            return "\(age)"
        case 3:
            return "\(salary)"
        default:
            return "Error!"
        }
    }
}


let person = Person(
    firstName: "Pitt",
    lastName: "Rojas",
    age: 28,
    salary: 30000
)

print(person[0])
print(person[3])

extension Person {
    func getAgeByTwo() -> Int {
        return self.age * 2
    }
}

print(person.getAgeByTwo())


let person2 = person
let person3 = Person(
    firstName: "Pitt",
    lastName: "Rojas",
    age: 28,
    salary: 30000
)

if person === person3 {
    print("Objects are the same")
} else {
    print("Objects are different")
}

extension Person {
    static func == (lhs: Person, rhs: Person) -> Bool {
        return lhs.age == rhs.age && lhs.firstName == rhs.firstName
    }
}


if person == person3 {
    print("Info is the same")
} else {
    print("Info is different")
}
