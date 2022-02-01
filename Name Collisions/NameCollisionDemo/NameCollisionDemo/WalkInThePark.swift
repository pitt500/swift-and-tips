//
//  WalkInThePark.swift
//  NameCollisionDemo
//
//  Created by Pedro Rojas on 01/02/22.
//

import Animal
import Human

class WalkInThePark {
    func enjoyTheDay() {
        let dog = Dog.Action()
        let person = Person.Action()
        
        person.move()
        dog.run()
        dog.run()
        person.run()
        dog.sleep()
    }
}
