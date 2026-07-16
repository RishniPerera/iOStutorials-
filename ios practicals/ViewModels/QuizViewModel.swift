//
//  QuizViewModel.swift
//  ios practicals
//
//  Created by Student 1 on 2026-07-01.
//

import Foundation
import Combine

@MainActor
class QuizViewModel: ObservableObject {

    // view state
    enum ViewState {
        case loading
        case loaded
        case failed(String)
    }

    // published properties

    @Published var state: ViewState = .loading
    @Published var questions: [Question] = []
    @Published var currentQuestionIndex = 0
    @Published var score = 0
    @Published var streak = 0

    private let service = QuizService()

    // computed property

    var currentQuestion: Question? {
        guard currentQuestionIndex < questions.count else {
            return nil
        }
        return questions[currentQuestionIndex]
    }

    // load questions

    func loadQuestions() async {

        state = .loading

        do {
            questions = try await service.fetchQuestions()

            currentQuestionIndex = 0
            score = 0
            streak = 0

            state = .loaded

        } catch {

            state = .failed("Unable to load quiz.\nPlease check your internet connection.")
        }
    }

    // check answer
    func answerSelected(_ answer: String) {

        guard let question = currentQuestion else {
            return
        }

        if answer == question.correct_answer {
            streak += 1
            score += 10 + (streak * 2)
        } else {
            streak = 0
            score = max(score - 2, 0)
        }

        nextQuestion()
    }

    // next question
    func nextQuestion() {
        currentQuestionIndex += 1
    }
    
    // quiz finished
    var quizFinished: Bool {
        currentQuestionIndex >= questions.count
    }
}
