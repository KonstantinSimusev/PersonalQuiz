//
//  ViewController.swift
//  PersonalQuiz
//
//  Created by Konstantin Simusev on 24.06.2022.
//

import UIKit

class IntroductionViewController: UIViewController {
    
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
    
    override func viewDidLoad() {
        view.addVerticalGradientLayer(topColor: primaryColor, bottomColor: secondaryColor)
    }

    @IBAction func unwind(for unwindSegue: UIStoryboardSegue) {}
    
}

// MARK: - Set background
extension UIView {    
    func addVerticalGradientLayer(topColor: UIColor, bottomColor: UIColor) {
        let gradient = CAGradientLayer()
        gradient.frame = bounds
        gradient.colors = [topColor.cgColor, bottomColor.cgColor]
        gradient.locations = [0.0, 1.0]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 0, y: 1)
        layer.insertSublayer(gradient, at: 0)
    }
}
