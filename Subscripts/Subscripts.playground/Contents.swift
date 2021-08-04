import Foundation

typealias Birds = Array<String>
typealias DateOfBirth = Dictionary<String, Int>

var birds: Birds = ["Articuno", "Zapdos", "Moltres"]

var dateOfBirth: DateOfBirth = [
    "Maradona" : 1960,
    "Pele": 1940,
    "Cruyff": 1947,
    "Puyol": 1978
]


print(birds[1])
print(dateOfBirth["Puyol"]!)

birds[0] = "Artione"
dateOfBirth["Ronaldo"] = 1976






// MARK: - Without subscripts

print(birds.getValue(at: 1))
print(dateOfBirth.getValue(for: "Puyol")!)

birds.setValue("Artione", at: 0)
dateOfBirth.setValue(1976, for: "Ronaldo")


// MARK: - Building our custom Subscript

extension Array {
    subscript(safe index: Int) -> Element? {
        guard index >= startIndex, index <= endIndex
        else { return nil }

        return self[index]
    }
}


let planets = [
    "mercury", "venus", "earth",
    "mars", "jupiter", "saturn",
    "uranus", "neptune", "pluto?"
]

planets[safe: 10]




// MARK: - Subscript in custom types

struct Grid<T> {
    var data: [[T]]

    subscript(row: Int, column: Int) -> T {
        get {
            return data[row][column]
        }
        set {
            data[row][column] = newValue
        }
    }


}

var grid = Grid(
    data: [
        [1, 2, 3],
        [4, 5, 6],
        [7, 8, 9]
    ]
)


print(grid[2, 1])
grid[2, 1] = 111

print(grid[2, 1])


















