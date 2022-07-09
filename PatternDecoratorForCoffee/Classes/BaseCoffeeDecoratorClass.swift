//
//  BaseCoffeeDecoratorClass.swift
//  PatternDecoratorForCoffee
//
//  Created by Eduard on 26.08.2021.
//

class BaseCoffeeDecoratorClass: CoffeeDecorator {
    var ingredients: [String : Int] {
            return base.ingredients
    }
    var cost: Int {
        return base.cost
    }
    var base: Coffee
    required init(base: Coffee) {
        self.base = base
    }
}
