//
//  AddWhip.swift
//  PatternDecoratorForCoffee
//
//  Created by Eduard on 26.08.2021.
//

class AddWhip: CoffeeDecorator {
    var ingredients: [String : Int] {
        var coffeeIngredients = [
            "Milk": base.ingredients["Milk"]!,
            "Sugar": base.ingredients["Sugar"]!,
            "Whip": base.ingredients["Whip"]!
        ]
        coffeeIngredients["Whip"]! += 1
            return coffeeIngredients
    }
    
    var cost: Int {
        return base.cost + CostIngredients.costWhip.rawValue
    }
    var base: Coffee
    required init(base: Coffee) {
        self.base = base
    }
}
