//
//  QuizService.swift
//  ios practicals
//
//  Created by Student 1 on 2026-07-01.
//

import Foundation

struct QuizService {

    // API URL for simple questions
    private let urlString = "https://opentdb.com/api.php?amount=10&category=9&difficulty=easy&type=multiple"

    // fetch questions from the API
    func fetchQuestions() async throws -> [Question] {

        // create the URL
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }

        // download data
        let (data, _) = try await URLSession.shared.data(from: url)

        // Decode JSON into Swift models
        let response = try JSONDecoder().decode(TriviaResponse.self, from: data)

        // return only the questions
        return response.results
    }
}
