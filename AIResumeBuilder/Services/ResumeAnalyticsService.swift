//
//  ResumeAnalyticsService.swift
//  AIResumeBuilder
//
//  Created by Thribhuvan chavala on 13/06/26.
//

import Foundation

final class ResumeAnalyticsService {

    static let shared =
        ResumeAnalyticsService()

    private init() { }

    func totalResumes() -> Int {

        StorageService
            .shared
            .loadResumes()
            .count
    }

    func totalExports() -> Int {

        ExportHistoryService
            .shared
            .loadExports()
            .count
    }

    func averageATSScore() -> Int {

        let resumes =
            StorageService.shared
            .loadResumes()

        guard
            !resumes.isEmpty
        else {
            return 0
        }

        return 85
    }

    func mostUsedTemplate()
    -> String {

        "Modern"
    }

    func totalShares()
    -> Int {

        UserDefaults.standard
            .integer(
                forKey:
                "total_shares"
            )
    }

    func increaseShareCount() {

        let count =
            totalShares() + 1

        UserDefaults.standard
            .set(
                count,
                forKey:
                "total_shares"
            )
    }
}
