//
//  StorageService.swift
//  AIResumeBuilder
//
//  Created by Thribhuvan chavala on 11/06/26.
//

import Foundation

final class StorageService {

    static let shared =
        StorageService()

    private let key =
        "saved_resumes"

    func saveResumes(
        _ resumes: [Resume]
    ) {

        do {

            let data =
                try JSONEncoder().encode(
                    resumes
                )

            UserDefaults.standard.set(
                data,
                forKey: key
            )

        } catch {

            print(
                error.localizedDescription
            )
        }
    }

    func loadResumes() -> [Resume] {

        guard let data =
                UserDefaults.standard.data(
                    forKey: key
                ) else {

            return []
        }

        do {

            return try JSONDecoder()
                .decode(
                    [Resume].self,
                    from: data
                )

        } catch {

            print(
                error.localizedDescription
            )

            return []
        }
    }
}
