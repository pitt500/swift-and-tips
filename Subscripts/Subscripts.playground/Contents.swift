import Foundation

typealias Birds = Array<String>
typealias DateOfBirth = Dictionary<String, Int>

let birds: Birds = ["Articuno", "Zapdos", "Moltres"]

let dateOfBirth: DateOfBirth = [
    "Maradona" : 1960,
    "Pele": 1940,
    "Cruyff": 1947,
    "Puyol": 1978
]


print(birds[1])
print(dateOfBirth["Puyol"]!)
