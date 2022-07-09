//
//  ViewController.swift
//  PatternDecoratorForCoffee
//
//  Created by Eduard on 25.08.2021.
//

import UIKit

class ViewController: UIViewController {
    var simpleCoffee = SimpleCoffee()
    var finalCoffee: CoffeeDecorator?
    
    var oldValueOfMilkStepper: Double = 0
    var oldValueOfSugarStepper: Double = 0
    var oldValueOfWhipStepper: Double = 0
    
    @IBOutlet weak var coffeeMachineStack: UIStackView!
    @IBOutlet weak var nameCoffeeLabel: UILabel!
    @IBOutlet weak var backgroundForNameCoffeeLabel: UIView!
    @IBOutlet weak var backgroundMilkView: UIView!
    @IBOutlet weak var backgroundSugarView: UIView!
    @IBOutlet weak var backgroundWhipView: UIView!
    @IBOutlet weak var addReduceMilkStepper: UIStepper!
    @IBOutlet weak var addReduceSugarStepper: UIStepper!
    @IBOutlet weak var addReduceWhipStepper: UIStepper!
    
   
    @IBAction func addReduceMilkStepperButton(_ sender: Any) {
        if addReduceMilkStepper.value > 3 {
            addReduceMilkStepper.value = 3
            return
        }
        switch addReduceMilkStepper.value-oldValueOfMilkStepper>0 {
            case true:
                finalCoffee = AddMilk(base: finalCoffee!)
            case false:
                finalCoffee = ReduceMilk(base: finalCoffee!)
        }
        
        oldValueOfMilkStepper = addReduceMilkStepper.value
        changeNameCoffeeLabel()
    }
    @IBAction func addReduceSugarStepperButton(_ sender: Any) {
        if addReduceSugarStepper.value > 3 {
            addReduceSugarStepper.value = 3
            return
        }
        switch addReduceSugarStepper.value-oldValueOfSugarStepper>0 {
            case true:
                finalCoffee = AddSugar(base: finalCoffee!)
            case false:
                finalCoffee = ReduceSugar(base: finalCoffee!)
        }
        oldValueOfSugarStepper = addReduceSugarStepper.value
        changeNameCoffeeLabel()
    }
    @IBAction func addReduceWhipStepperButton(_ sender: Any) {
        if addReduceWhipStepper.value > 3 {
            addReduceWhipStepper.value = 3
            return
        }
        switch addReduceWhipStepper.value-oldValueOfWhipStepper>0 {
            case true:
                finalCoffee = AddWhip(base: finalCoffee!)
            case false:
                finalCoffee = ReduceWhip(base: finalCoffee!)
        }
        oldValueOfWhipStepper = addReduceWhipStepper.value
        changeNameCoffeeLabel()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configuringMainView()
        finalCoffee = BaseCoffeeDecoratorClass(base: simpleCoffee)
        nameCoffeeLabel.text = "Просто кофе. Стоит: \(finalCoffee!.cost) руб."
    }

    private func configuringMainView() {
        coffeeMachineStack.transform = CGAffineTransform(rotationAngle: -.pi/2)
        
        backgroundForNameCoffeeLabel.applyGradient(colours: [UIColor.lightGray.withAlphaComponent(1.0), UIColor.darkGray.withAlphaComponent(0.5)], locations: nil)
        backgroundMilkView.applyGradient(colours: [UIColor.lightGray.withAlphaComponent(1.0), UIColor.black.withAlphaComponent(0.0)], locations: nil)
        backgroundSugarView.applyGradient(colours: [UIColor.lightGray.withAlphaComponent(1.0), UIColor.black.withAlphaComponent(0.0)], locations: nil)
        backgroundWhipView.applyGradient(colours: [UIColor.lightGray.withAlphaComponent(1.0), UIColor.black.withAlphaComponent(0.0)], locations: nil)

        addReduceMilkStepper.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        addReduceSugarStepper.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        addReduceWhipStepper.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        addReduceMilkStepper.setDecrementImage(addReduceMilkStepper.decrementImage(for: .normal), for: .normal)
        addReduceMilkStepper.setIncrementImage(addReduceMilkStepper.incrementImage(for: .normal), for: .normal)
        addReduceMilkStepper.tintColor = .white
        addReduceSugarStepper.setDecrementImage(addReduceSugarStepper.decrementImage(for: .normal), for: .normal)
        addReduceSugarStepper.setIncrementImage(addReduceSugarStepper.incrementImage(for: .normal), for: .normal)
        addReduceSugarStepper.tintColor = .white
        addReduceWhipStepper.setDecrementImage(addReduceWhipStepper.decrementImage(for: .normal), for: .normal)
        addReduceWhipStepper.setIncrementImage(addReduceWhipStepper.incrementImage(for: .normal), for: .normal)
        addReduceSugarStepper.tintColor = .white

    }
    
    private func changeNameCoffeeLabel(){
        var fullNameCoffee = "Кофе "
        switch finalCoffee?.ingredients["Milk"] {
            case 0:
                fullNameCoffee = fullNameCoffee + "без молока, "
            case 1:
                fullNameCoffee = fullNameCoffee + "с молоком, "
            case 2:
                fullNameCoffee = fullNameCoffee + "с двойным молоком, "
            case 3:
                fullNameCoffee = fullNameCoffee + "с тройным молоком, "
            default:
                break
        }
        switch finalCoffee?.ingredients["Sugar"] {
            case 0:
                fullNameCoffee = fullNameCoffee + "без сахара, "
            case 1:
                fullNameCoffee = fullNameCoffee + "с сахаром, "
            case 2:
                fullNameCoffee = fullNameCoffee + "с двойным сахаром, "
            case 3:
                fullNameCoffee = fullNameCoffee + "с тройным сахаром, "
            default:
                break
        }
        switch finalCoffee?.ingredients["Whip"] {
            case 0:
                fullNameCoffee = fullNameCoffee + "без сливок"
            case 1:
                fullNameCoffee = fullNameCoffee + "со сливками"
            case 2:
                fullNameCoffee = fullNameCoffee + "с двойными сливками"
            case 3:
                fullNameCoffee = fullNameCoffee + "с тройным сливками"
            default:
                break
        }
        nameCoffeeLabel.text = fullNameCoffee + ". Стоит: \(finalCoffee!.cost) руб."
    }
}

extension UIView {
    func applyGradient(colours: [UIColor], locations: [NSNumber]?) {
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = colours.map { $0.cgColor }
        gradient.locations = locations
        gradient.startPoint = CGPoint(x: 0.3, y: 0.5)
        gradient.endPoint = CGPoint(x: 1, y: 0.5)
        self.layer.insertSublayer(gradient, at: 0)
    }
}

