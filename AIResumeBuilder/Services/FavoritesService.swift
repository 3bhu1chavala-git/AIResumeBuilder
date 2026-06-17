//
//  FavoritesService.swift
//  AIResumeBuilder
//
//  Created by Thribhuvan chavala on 15/06/26.
//

import Foundation

final class FavoritesService {

    static let shared =
        FavoritesService()

    private let key =
        "favorite_resumes"

    func save(
        resumeID: UUID
    ) {

        var ids =
            load()

        if !ids.contains(
            resumeID.uuidString
        ) {

            ids.append(
                resumeID.uuidString
            )
        }

        UserDefaults.standard
            .set(
                ids,
                forKey: key
            )
    }

    func remove(
        resumeID: UUID
    ) {

        var ids =
            load()

        ids.removeAll {
            $0 ==
            resumeID.uuidString
        }

        UserDefaults.standard
            .set(
                ids,
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

    func isFavorite(
        resumeID: UUID
    ) -> Bool {

        load().contains(
            resumeID.uuidString
        )
    }
}
