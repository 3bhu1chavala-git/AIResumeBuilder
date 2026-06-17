//
//  Experience.swift
//  AIResumeBuilder
//
//  Created by Thribhuvan chavala on 11/06/26.
//

import Foundation

struct Experience: Identifiable, Codable {

    let id: UUID

    var company: String
    var role: String
    var startDate: String
    var endDate: String
    var responsibilities: String

    init(
        id: UUID = UUID(),
        company: String = "",
        role: String = "",
        startDate: String = "",
        endDate: String = "",
        responsibilities: String = ""
    ) {
        self.id = id
        self.company = company
        self.role = role
        self.startDate = startDate
        self.endDate = endDate
        self.responsibilities = responsibilities
    }
}
