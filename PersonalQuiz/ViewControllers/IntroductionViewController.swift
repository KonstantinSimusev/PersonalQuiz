//
//  ViewController.swift
//  PersonalQuiz
//
//  Created by Konstantin Simusev on 24.06.2022.
//

import UIKit

class IntroductionViewController: UIViewController {

    override func viewDidLoad() {
        view.addVerticalGradientLayer(
            topColor: .green,
            bottomColor: .blue
        )
    }

    @IBAction func unwind(for unwindSegue: UIStoryboardSegue) {}
    
}
