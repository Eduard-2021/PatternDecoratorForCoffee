//
//  CoffeeDecorator.swift
//  PatternDecoratorForCoffee
//
//  Created by Eduard on 26.08.2021.
//

protocol  CoffeeDecorator: Coffee {
    var base: Coffee { get }
       init(base: Coffee)
}
