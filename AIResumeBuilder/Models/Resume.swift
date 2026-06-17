//
//  Resume.swift
//  AIResumeBuilder
//
//  Created by Thribhuvan chavala on 11/06/26.
//
import Foundation

struct Resume:
    Identifiable,
    Codable {

    let id: UUID

    var fullName: String
    var email: String
    var phone: String

    var summary: String

    var template:
        TemplateType

    init(
        id: UUID = UUID(),
        fullName: String = "",
        email: String = "",
        phone: String = "",
        summary: String = "",
        template:
            TemplateType = .modern
    ) {

        self.id = id
        self.fullName = fullName
        self.email = email
        self.phone = phone
        self.summary = summary
        self.template = template
    }
}
