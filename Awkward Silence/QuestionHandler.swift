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
    
    init(fileName: String, randomOrder: Bool) {
        currentQuestion = "Let's start..."
        numberOfQuestions = 0
        questions = []
        askedQuestions = []
        self.randomOrder = randomOrder
        lastQuestionIndex = 0
        self.fileName = fileName
        loadQuestions()
    }
    
    func nextQuestion() {
        if askedQuestions.count == numberOfQuestions {
            currentQuestion = "All questions have been asked. Click on 'Next question' to restart."
            askedQuestions = []
            return
        }
        
        if randomOrder {
            lastQuestionIndex = Int.random(in: 0...numberOfQuestions - 1)
            while askedQuestions.contains(lastQuestionIndex) {
                lastQuestionIndex = Int.random(in: 0...numberOfQuestions - 1)
            }
        } else {
            lastQuestionIndex += 1
        }
        
        currentQuestion = questions[lastQuestionIndex]
        askedQuestions.append(lastQuestionIndex)
    }
    
    func loadQuestions() {
        let path = Bundle.main.path(forResource: self.fileName, ofType: "txt")!
        let content = try! String(contentsOfFile: path, encoding: String.Encoding.utf8)
        var lines = content.components(separatedBy: .newlines)
        lines.removeAll { s in
            s.isEmpty
        }
        numberOfQuestions = lines.count
        questions = lines
    }
}
