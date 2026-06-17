//
//  InterviewStorageService.swift
//  AIResumeBuilder
//
//  Created by Thribhuvan chavala on 15/06/26.
//

import Foundation

final class InterviewStorageService {

    static let shared =
        InterviewStorageService()

    private let key =
        "saved_questions"

    func save(
        question: String
    ) {

        var questions =
            load()

        questions.append(
            question
        )

        UserDefaults.standard
            .set(
                questions,
                forKey: key
            )
    }

    func load()
    -> [String] {

        UserDefaults.standard
            .stringArray(
                forKey: key
            ) ?? []
    }
}
