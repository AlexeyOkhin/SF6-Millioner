//
//  GameModel.swift
//  SF6-Millioner
//
//  Created by Djinsolobzik on 09.02.2023.
//

import Foundation

struct Question: Decodable {
    let level: Int
    let ask: String
    let correctAnswer: String
    var wrongAnswers: [String]
    var cost: String?

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
    let costQuestion = ["100", "200", "300", "500", "1 000", "2 000", "4 000", "8 000", "16 000", "32 000", "64 000", "128 000", "256 000", "500 000", "1 Миллион"]
    var hiScoreDictionary: [String: String] = [:]
    
    mutating func saveHiScore(by name: String, new hiScore: String) {
        hiScoreDictionary[name] = hiScore
    }


    var currentQuestion: Question {
        var question = questions.first { $0.level == level } ?? Question(level: 1, ask: "Нет Вопросов(", correctAnswer: "?", wrongAnswers: ["?", "?", "?"])
        question.cost = costQuestion[level - 1]
        return question
    }

    mutating func nextLevel() {
            if level > 0 && level < 15 {
                level += 1
            }
        }

    func checkAnswer(answer: String) -> Bool {
        return answer == currentQuestion.correctAnswer
    }

    func showFiftyFifty() -> (String, String) {
        let correctAnswer = currentQuestion.correctAnswer
        let wrongAnswer = currentQuestion.wrongAnswers.randomElement()!
        let newArrayWrong = currentQuestion.wrongAnswers.filter { $0 != wrongAnswer }
        
        return (correctAnswer, wrongAnswer)
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

