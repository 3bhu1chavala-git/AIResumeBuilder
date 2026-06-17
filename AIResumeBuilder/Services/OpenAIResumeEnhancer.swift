//
//  OpenAIResumeEnhancer.swift
//  AIResumeBuilder
//
//  Created by Thribhuvan chavala on 13/06/26.
//
import Foundation

final class OpenAIResumeEnhancer {

    static let shared =
        OpenAIResumeEnhancer()

    private init() { }

    func improveSummary(
        currentSummary: String,
        completion:
        @escaping (String) -> Void
    ) {

        let improvedSummary =
        """
        Results-driven professional with strong technical expertise, problem-solving abilities, and experience delivering high-quality solutions in fast-paced environments.
        """

        completion(
            improvedSummary
        )
    }

    func generateATSKeywords(
        skills: String
    ) -> [String] {

        let keywords =
            skills
            .split(separator: ",")

        return keywords.map {
            String($0)
                .trimmingCharacters(
                    in:
                    .whitespaces
                )
        }
    }
}
