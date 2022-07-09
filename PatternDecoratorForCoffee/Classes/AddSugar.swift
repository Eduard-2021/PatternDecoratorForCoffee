//
//  AddSugar.swift
//  PatternDecoratorForCoffee
//
//  Created by Eduard on 26.08.2021.
//

class AddSugar: CoffeeDecorator {
    var cost: Int {
        return base.cost + CostIngredients.costSugar.rawValue
    }
    
    var ingredients: [String : Int] {
        var coffeeIngredients = [
            "Milk": base.ingredients["Milk"]!,
            "Sugar": base.ingredients["Sugar"]!,
            "Whip": base.ingredients["Whip"]!
        ]
        coffeeIngredients["Sugar"]! += 1
            return coffeeIngredients
    }
    
    var base: Coffee
    required init(base: Coffee) {
        self.base = base
    }
}
