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
    
    var answers: [Answer]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addVerticalGradientLayer(
            topColor: Color.steelBlue,
            bottomColor: Color.lightCyan
        )
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
