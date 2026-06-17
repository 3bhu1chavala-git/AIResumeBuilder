//
//  ExportHistoryService.swift
//  AIResumeBuilder
//
//  Created by Thribhuvan chavala on 13/06/26.
//

import Foundation

final class ExportHistoryService {

    static let shared =
        ExportHistoryService()

    private let key =
        "export_history"

    func saveExport(
        fileName: String
    ) {

        var exports =
            loadExports()

        exports.insert(
            fileName,
            at: 0
        )

        UserDefaults.standard.set(
            exports,
            forKey: key
        )
    }

    func loadExports()
    -> [String] {

        UserDefaults.standard
            .stringArray(
                forKey: key
            ) ?? []
    }

    func clearExports() {

        UserDefaults.standard
            .removeObject(
                forKey: key
            )
    }
}
