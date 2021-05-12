import Foundation

struct User {
    var email: String
    @Age var age: Int
    var firstName: String
    var lastName: String
}

@propertyWrapper
struct Age {
    private var age: Int = 0

    init(wrappedValue: Int) {
        self.wrappedValue = wrappedValue
    }

    var wrappedValue: Int {
        get { age }
        set { age = max(0, newValue) }
    }
}


var user = User(
    email: "hello@demo.com",
    age: -1,
    firstName: "Pitt",
    lastName: "Rojas"
)

// Initial value
print(user.age) // output: 0
//Modifying the value
user.age = -1000
print(user.age) // output: 0

//Correct age
user.age = 34
print(user.age) // output: 34
