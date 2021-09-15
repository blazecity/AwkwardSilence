//
//  Question.swift
//  Awkward Silence
//
//  Created by Jan Baumann on 14.09.21.
//

import Foundation

class QuestionHandler: ObservableObject {
    @Published var currentQuestion: String
    var numberOfQuestions: Int
    var questions: [String]
    var askedQuestions: [Int]
    var randomOrder: Bool
    var lastQuestionIndex: Int
    var fileName: String
    var randomIndizes: [Int]
    
    init(fileName: String, randomOrder: Bool) {
        currentQuestion = "Let's start..."
        numberOfQuestions = 0
        questions = []
        askedQuestions = []
        self.randomOrder = randomOrder
        lastQuestionIndex = -1
        self.fileName = fileName
        randomIndizes = []
        loadQuestions()
    }
    
    func nextQuestion() {
        lastQuestionIndex += 1
        if askedQuestions.count == numberOfQuestions {
            currentQuestion = "All questions have been asked. Click on 'Next question' to restart."
            askedQuestions = []
            lastQuestionIndex = -1
            if randomOrder {
                randomIndizes.shuffle()
            }
            return
        }
        let lastQuestion = randomIndizes[lastQuestionIndex]
        currentQuestion = questions[lastQuestion]
        askedQuestions.append(lastQuestion)
    }
    
    func loadQuestions() {
        let path = Bundle.main.path(forResource: self.fileName, ofType: "txt")!
        let content = try! String(contentsOfFile: path, encoding: String.Encoding.utf8)
        var lines = content.components(separatedBy: .newlines)
        lines.removeAll { s in
            s.isEmpty
        }
        numberOfQuestions = lines.count
        randomIndizes = [Int](0...numberOfQuestions - 1)
        if randomOrder {
            randomIndizes.shuffle()
        }
        questions = lines
    }
}
