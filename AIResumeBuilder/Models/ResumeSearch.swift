//
//  ResumeSearch.swift
//  AIResumeBuilder
//
//  Created by Thribhuvan chavala on 13/06/26.
//

import Foundation

struct ResumeSearch {

    static func filter(
        resumes: [Resume],
        searchText: String
    ) -> [Resume] {

        guard
            !searchText.isEmpty
        else {

            return resumes
        }

        return resumes.filter {

            $0.fullName
                .localizedCaseInsensitiveContains(
                    searchText
                )

            ||

            $0.email
                .localizedCaseInsensitiveContains(
                    searchText
                )
        }
    }
}
