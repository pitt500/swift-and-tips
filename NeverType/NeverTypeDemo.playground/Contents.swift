import SwiftUI

// MARK: - All the functions return a type (even Void)
func functionReturningInt() -> Int {
    return 10
}

func functionReturningVoid() /* -> () */ {
    print("Swift { && tips }!")
    let void: () = Void()

    return void

    //returns () or Void()
}

// MARK: - Tuples

// Simple inline objects that you can build to return multiple values for a function
// or closure
let tutle = (number:1, string: "a")
let emptyTuple: Void = ()



// MARK: - Ignoring error cases when our code never fails
enum DemoError: Error {
    case randomError
}

func doSomething(completion: (Result<String, Never>) -> Void) {
//    let isEverythingOk = Bool.random()

//    if isEverythingOk {
//        completion(.success("OK"))
//    } else {
//        //completion(.failure(.randomError))
//    }

    // We don't need to care about failure case anymore with Never!
    completion(.success("Ok"))
}

doSomething { result in
    switch result {

    case .success(let value):
        print(value)

    // failure case is never
    }
}


// MARK: - How SwiftUI avoid an infinite loop reviewing all body properties in subviews?
struct DemoView: View {
    var body: some View {
        ZStack {
            VStack {
                Image(systemName: "star.fill")
                Text("This is a demo!")
                Button("Press me") {
                    print("Hello my friend!")
                }
            }
            .padding(10)
        }
    }
}



// MARK: - Never in SwiftUI's views
protocol NeverView: View where Self.Body == Never {}

struct ContentView: NeverView {
    var body: Never { fatalError() }
    let text: String
}

// It will crash, you can't create primitive views without a body, only Apple ☹️.
let view = ContentView(text: "Hello")
