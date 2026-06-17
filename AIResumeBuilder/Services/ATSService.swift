//
//  ATSService.swift
//  AIResumeBuilder
//
//  Created by Thribhuvan chavala on 11/06/26.
//

import Foundation

final class ATSService {

    static let shared =
        ATSService()

    func calculateScore(
        skills: String,
        experiences: Int
    ) -> Int {

        var score = 0

        let skillCount =
            skills
            .split(separator: ",")

        score += min(
            skillCount.count * 10,
            50
        )

        score += min(
            experiences * 15,
            50
        )

        return min(
            score,
            100
        )
    }
}
