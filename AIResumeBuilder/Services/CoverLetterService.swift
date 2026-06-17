//
//  CoverLetterService.swift
//  AIResumeBuilder
//
//  Created by Thribhuvan chavala on 15/06/26.
//

import Foundation

final class CoverLetterService {

    static let shared =
        CoverLetterService()

    private init() { }

    func generate(
        name: String,
        position: String,
        company: String
    ) -> String {

        """
        Dear Hiring Manager,

        I am writing to express my interest in the \(position) position at \(company).

        My technical background, problem-solving skills, and commitment to delivering high-quality solutions make me a strong candidate for this role.

        I would welcome the opportunity to contribute to your team and help achieve your business goals.

        Thank you for your time and consideration.

        Sincerely,

        \(name)
        """
    }
}
