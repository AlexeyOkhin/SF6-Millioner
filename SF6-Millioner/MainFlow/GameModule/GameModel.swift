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
    var newArrayWrong: [String]?

}

struct Game {

    var timeLevel = 30
    var timeAfterResult = 5
    var level = 1
    var isEnebleFiftyFifty = true
    var isEnebleFHopeHalp = true
    var isEnebleSecondLife = true
    var nameGamer: String = ""
    var fireproofAmount: Int
    var currentSum = "0"
    var live = 1
    var questions = Bundle.main.decode([Question].self, from: "questions.json").shuffled()
    var isWin = false
    var currentQuestion: Question?
    //var usedRighteToMistake = true
    let costQuestion = ["100", "200", "300", "500", "1000", "2000", "4000", "8000", "16000", "32000", "64000", "128000", "256000", "500000", "1Миллион"]
    //var hiScoreDictionary: [String: String] = [:]
    
//    var currentQuestion: Question {
//        var question = questions.first { $0.level == level } ?? Question(level: 1, ask: "Нет Вопросов(", correctAnswer: "?", wrongAnswers: ["?", "?", "?"])
//        question.cost = costQuestion[level - 1]
//        question.newArrayWrong = question.wrongAnswers
//        return question
//    }

    mutating func getCurrentQuestion() -> Question {
        var question = questions.first { $0.level == level } ?? Question(level: 1, ask: "Нет Вопросов(", correctAnswer: "?", wrongAnswers: ["?", "?", "?"])
        question.cost = costQuestion[level - 1]
        currentQuestion = question
        return question
    }

//    mutating func saveHiScore(by name: String, new hiScore: String) {
//        hiScoreDictionary[name] = hiScore
//    }

    mutating func nextLevel() {
            if level > 0 && level < 15 {
                level += 1
            }
        }

    mutating func checkAnswer(answer: String) -> Bool {
        if !(answer == getCurrentQuestion().correctAnswer) {
            live -= 1
        }
        return answer == getCurrentQuestion().correctAnswer //currentQuestion.correctAnswer
    }

    mutating func showFiftyFifty() -> (String, String) {
        let correctAnswer = getCurrentQuestion().correctAnswer //currentQuestion.correctAnswer
        let wrongAnswer = getCurrentQuestion().wrongAnswers.randomElement()!
        let newArrayWrong = getCurrentQuestion().wrongAnswers.filter { $0 == wrongAnswer }
        currentQuestion?.newArrayWrong = newArrayWrong
        return (correctAnswer, wrongAnswer)
    }

    private func settingFiftyFifty() {

    }

    mutating func showHallHelp(persent: Int) -> String {
        let roll = Int.random(in: 0...100)
        if roll <= persent {
            return currentQuestion?.correctAnswer ?? "Зал в замешательстве"
        }
        if !(currentQuestion?.newArrayWrong?.isEmpty ?? true) {
            return currentQuestion?.newArrayWrong?.randomElement() ?? "Зал в замешательстве"
        }
        return currentQuestion?.wrongAnswers.randomElement() ?? "Зал в замешательстве"
    }
//
//    mutating func useRighteToMistake() {
//        level += 1
//        live  -= 1
//        usedRighteToMistake.toggle()
//    }
}

