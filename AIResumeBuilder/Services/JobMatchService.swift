//
//  JobMatchService.swift
//  AIResumeBuilder
//
//  Created by Thribhuvan chavala on 13/06/26.
//

import Foundation

final class JobMatchService {

    static let shared =
        JobMatchService()

    private init() { }

    func calculateMatch(
        resumeSkills: String,
        jobDescription: String
    ) -> Int {

        let skills =
            resumeSkills
            .lowercased()

        let job =
            jobDescription
            .lowercased()

        let words =
            skills.components(
                separatedBy: ","
            )

        let matches =
            words.filter {
                job.contains(
                    $0.trimmingCharacters(
                        in:
                        .whitespaces
                    )
                )
            }

        guard !words.isEmpty
        else {
            return 0
        }

        return Int(
            Double(
                matches.count
            ) /
            Double(
                words.count
            ) * 100
        )
    }
}
