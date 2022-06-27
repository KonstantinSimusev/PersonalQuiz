//
//  ResultsViewController.swift
//  PersonalQuiz
//
//  Created by Konstantin Simusev on 26.06.2022.
//

import UIKit

class ResultsViewController: UIViewController {
    @IBOutlet var animaTypelLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    private let primaryColor = UIColor(
        red: 70/255,
        green: 130/255,
        blue: 180/255,
        alpha: 1
    )
    
    private let secondaryColor = UIColor(
        red: 224/255,
        green: 255/255,
        blue: 255/255,
        alpha: 1
    )

    var answers: [Answer]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addVerticalGradientLayer(topColor: primaryColor, bottomColor: secondaryColor)
        navigationItem.hidesBackButton = true
        updateResult()
    }
}

// MARK: - Private Methods
extension ResultsViewController {

    private func updateResult() {

        var frequencyOfAnimals: [AnimalType: Int] = [:]
        
        guard let answers = answers else { return }
        let animals = answers.map { $0.type }

        for animal in animals {
            if let animalTypeCount = frequencyOfAnimals[animal] {
                frequencyOfAnimals.updateValue(animalTypeCount + 1, forKey: animal)
            } else {
                frequencyOfAnimals[animal] = 1
            }
        }

        let sortedFrequencyOfAnimals = frequencyOfAnimals.sorted { $0.value > $1.value }
        guard let mostFrequencyAnimal = sortedFrequencyOfAnimals.first?.key else { return }

        updateUI(with: mostFrequencyAnimal)
    }

    private func updateUI(with animal: AnimalType?) {
        animaTypelLabel.text = "Вы - \(animal?.rawValue ?? "🐶")!"
        descriptionLabel.text = animal?.definition ?? ""
    }
}
