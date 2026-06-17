//
//  ATSRecommendationService.swift
//  AIResumeBuilder
//
//  Created by Thribhuvan chavala on 15/06/26.
//

import Foundation

final class ATSRecommendationService {

    static let shared =
        ATSRecommendationService()

    private init() { }

    func suggestions(
        score: Int
    ) -> [String] {

        switch score {

        case 90...100:

            return [
                "Resume is ATS optimized.",
                "Keep skills updated."
            ]

        case 75..<90:

            return [
                "Add more keywords.",
                "Improve summary section."
            ]

        case 60..<75:

            return [
                "Add measurable achievements.",
                "Expand technical skills.",
                "Use industry keywords."
            ]

        default:

            return [
                "Rewrite summary.",
                "Add relevant experience.",
                "Improve keyword density.",
                "Include certifications."
            ]
        }
    }
}
