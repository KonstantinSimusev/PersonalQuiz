//
//  Question.swift
//  PersonalQuiz
//
//  Created by Konstantin Simusev on 26.06.2022.
//

import UIKit

struct Question {
    let title: String
    let type: ResponseType
    let answers: [Answer]
    
    static func getQuestions() -> [Question] {
        [
            Question(
                title: "Какую пищу Вы предпочитаете?",
                type: .single,
                answers: [
                    Answer(title: "🥩", type: .dog),
                    Answer(title: "🐠", type: .cat),
                    Answer(title: "🥕", type: .rabbit),
                    Answer(title: "🌽", type: .turtle)
                ]
            ),
            Question(
                title: "Что Вам нравится больше?",
                type: .multiple,
                answers: [
                    Answer(title: "🏊‍♂️", type: .dog),
                    Answer(title: "😴", type: .cat),
                    Answer(title: "🍽", type: .rabbit),
                    Answer(title: "🌞", type: .turtle)
                ]
            ),
            Question(
                title: "Любите ли Вы поездки на машине?",
                type: .ranged,
                answers: [
                    Answer(title: "👎", type: .dog),
                    Answer(title: "Нервничаю", type: .cat),
                    Answer(title: "Не замечаю", type: .rabbit),
                    Answer(title: "👍", type: .turtle)
                ]
            )
        ]
    }
}

enum ResponseType {
    case single
    case multiple
    case ranged
}

struct Answer {
    let title: String
    let type: AnimalType
}

enum AnimalType: Character {
    case dog = "🐶"
    case cat = "🐱"
    case rabbit = "🐰"
    case turtle = "🐢"
    
    var definition: String {
        switch self {
        case .dog:
            return "Вам нравится быть с друзьями. Вы окружаете себя людьми, которые Вам нравятся и всегда готовы помощь."
        case .cat:
            return "Вы себе на уме. Любите гулять сами по себе. Вы цените одиночество."
        case .rabbit:
            return "Вам нравится все мягкое. Вы здоровы и полны энергии."
        case .turtle:
            return "Ваша сила - в мудрости. Медленный и вдумчивый выигрывает на больших дистанциях."
        }
    }
}

