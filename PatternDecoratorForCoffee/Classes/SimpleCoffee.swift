//
//  SimpleCoffee.swift
//  PatternDecoratorForCoffee
//
//  Created by Eduard on 26.08.2021.
//

class SimpleCoffee: Coffee {
    var cost: Int {
        return 50
    }
    
    var ingredients: [String : Int] {
        return [
            "Milk": 0,
            "Sugar": 0,
            "Whip": 0
        ]
    }
}
