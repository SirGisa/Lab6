//
//  ViewController.swift
//  project3
//
//  Created by Shvarsman on 1.05.25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var heightTextField: UITextField!
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var sexSegmentedControl: UISegmentedControl!
    @IBOutlet weak var activitySegmentControl: UISegmentedControl!
    @IBOutlet weak var resultsLabel: UILabel!
    
    @IBAction func calculateTapped(_ sender: Any) {
                guard let ageText = ageTextField.text, !ageText.isEmpty,
                      let heightText = heightTextField.text, !heightText.isEmpty,
                      let weightText = weightTextField.text, !weightText.isEmpty else {
                    resultsLabel.text = "Пожалуйста, заполните все поля."
                    return
                }

                guard let age = Double(ageText),
                      let height = Double(heightText),
                      let weight = Double(weightText) else {
                    resultsLabel.text = "Неверный формат ввода."
                    return
                }

                let isMale = sexSegmentedControl.selectedSegmentIndex == 0

                let bmi = weight / pow(height / 100, 2)
                let bmiString = String(format: "%.1f", bmi)

                var bmr: Double
                if isMale {
                    bmr = 88.36 + (13.4 * weight) + (4.8 * height) - (5.7 * age)
                } else {
                    bmr = 447.6 + (9.2 * weight) + (3.1 * height) - (4.3 * age)
                }
                let bmrString = String(format: "%.0f", bmr)

                let activityLevel = activitySegmentControl.selectedSegmentIndex
                let activityFactors = [1.2, 1.375, 1.55, 1.725]
                let totalCalories = bmr * activityFactors[activityLevel]
                let totalCaloriesString = String(format: "%.0f", totalCalories)

                resultsLabel.text = """
                Вы должны потреблять \(totalCaloriesString) килокалорий для поддержания веса.
                Индекс массы тела \(bmiString).
                """
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

