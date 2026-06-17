//
//  ATSReportService.swift
//  AIResumeBuilder
//
//  Created by Thribhuvan chavala on 15/06/26.
//

import Foundation

final class ATSReportService {

    static let shared =
        ATSReportService()

    private let key =
        "ats_reports"

    func save(
        score: Int
    ) {

        var reports =
            load()

        reports.append(
            score
        )

        UserDefaults.standard
            .set(
                reports,
                forKey: key
            )
    }

    func load()
    -> [Int] {

        UserDefaults.standard
            .array(
                forKey: key
            ) as? [Int] ?? []
    }
}
