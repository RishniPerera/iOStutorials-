//
//  QuizModels.swift
//  ios practicals
//
//  Created by Student 1 on 2026-07-01.
//
import Foundation

// represents all response from the API
struct TriviaResponse: Codable {
    let results: [Question]
}

// for a single trivia question
struct Question: Codable, Identifiable {
    let id = UUID() //  our own generated id since API does not provide an id

    let question: String
    let correct_answer: String
    let incorrect_answers: [String]

    // combine the correct and incorrect answers and then shuffle them
    var allAnswers: [String] {
        (incorrect_answers + [correct_answer]).shuffled()
    }

    // ignore the generated UUID when decoding JSON
    enum CodingKeys: String, CodingKey {
        case question
        case correct_answer
        case incorrect_answers
    }
}
    
// handle html decoding 
extension String {
    var htmlDecoded: String {
        let replacements: [String: String] = [
            "&quot;": "\"",
            "&#039;": "'",
            "&amp;": "&",
            "&lt;": "<",
            "&gt;": ">",
            "&eacute;": "é",
            "&rsquo;": "’",
            "&ldquo;": "“",
            "&rdquo;": "”"
        ]
        var result = self
        for (encoded, decoded) in replacements {
            result = result.replacingOccurrences(of: encoded, with: decoded)
        }
        return result
    }
}
