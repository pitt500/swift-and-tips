import Foundation

protocol Animal {}

struct Dog: Animal {}
struct Cat: Animal {}

func adoptPet() -> some Animal {
    Cat()
}

print(type(of: adoptPet()))
