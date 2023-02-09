//
//  GameModel.swift
//  SF6-Millioner
//
//  Created by Djinsolobzik on 09.02.2023.
//

import Foundation

class Question: Decodable {
    let level: Int
    let ask: String
    let correctAnswer: String
    var wrongAnswers: [String]
    
    init(level: Int, ask: String, correctAnswer: String, wrongAnswers: [String]) {
        self.level = level
        self.ask = ask
        self.correctAnswer = correctAnswer
        self.wrongAnswers = wrongAnswers
    }
}

struct Game {

    var timeLevel = 30
    var timeAfterResult = 5
    var level = 1
    var nameGamer: String
    var fireproofAmount: Int
    var currentSum = 0
    var live = 1
    var questions = Bundle.main.decode([Question].self, from: "questions.json").shuffled()
    var isWin = false
    var usedRighteToMistake = true


    var currentQuestion: Question {
        return questions.first { $0.level == level } ?? Question(level: 1, ask: "Нет Вопросов(", correctAnswer: "?", wrongAnswers: ["?", "?", "?"])
    }

    mutating func nextLevel() {
        level += 1
    }

    func checkAnswer(answer: String) -> Bool {
        return answer == currentQuestion.correctAnswer
    }

    func showFiftyFifty() -> (String, String) {
        return (currentQuestion.correctAnswer, Array(currentQuestion.wrongAnswers.shuffled())[0])
    }

    func showHallHelp(persent: Int) -> String {
        let roll = Int.random(in: 0...100)
        if roll <= persent {
            return currentQuestion.correctAnswer
        }
        return currentQuestion.wrongAnswers.randomElement() ?? "Зал в замешательстве"
    }

    mutating func useRighteToMistake() {
        level += 1
        live  -= 1
        usedRighteToMistake.toggle()
    }
}

