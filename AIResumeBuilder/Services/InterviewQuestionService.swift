//
//  InterviewQuestionService.swift
//  AIResumeBuilder
//
//  Created by Thribhuvan chavala on 15/06/26.
//

import Foundation

final class InterviewQuestionService {

    static let shared =
        InterviewQuestionService()

    private init() { }

    func questions(
        for skill: String
    ) -> [String] {

        [
            "Explain \(skill).",
            "What are the advantages of \(skill)?",
            "What are common challenges in \(skill)?",
            "Describe a real project using \(skill).",
            "What are best practices for \(skill)?"
        ]
    }
}
