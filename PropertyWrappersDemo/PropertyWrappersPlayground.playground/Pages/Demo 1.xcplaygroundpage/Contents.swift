import Foundation

struct User {
    var email: String
    // Equivalent: @Age(0) var age: Int
    @Age var age: Int = 0
    var firstName: String
    var lastName: String
}

@propertyWrapper
struct Age {
    private var age: Int

    init(wrappedValue initialValue: Int) {
        self.age = max(0, initialValue)
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
