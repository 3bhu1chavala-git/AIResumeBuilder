//
//  OpenAIService.swift
//  AIResumeBuilder
//
//  Created by Thribhuvan chavala on 11/06/26.
//
import Foundation

final class OpenAIService {

    private let apiKey =
        OpenAIConfiguration.apiKey

    func generateSummary(
        name: String,
        skills: String,
        completion: @escaping (String) -> Void
    ) {

        guard !apiKey.isEmpty else {

            completion(
                "Missing OpenRouter API Key."
            )

            return
        }

        guard let url = URL(
            string:
            "https://openrouter.ai/api/v1/chat/completions"
        ) else {

            completion(
                "Invalid URL."
            )

            return
        }

        let prompt = """

        Generate a professional resume summary.

        Name: \(name)

        Skills: \(skills)

        Keep it under 100 words.
        """

        let body: [String: Any] = [

            "model":
                "qwen/qwen3-32b:free",

            "messages": [

                [
                    "role": "user",
                    "content": prompt
                ]
            ]
        ]

        var request =
            URLRequest(url: url)

        request.httpMethod = "POST"

        request.setValue(
            "application/json",
            forHTTPHeaderField:
                "Content-Type"
        )

        request.setValue(
            "Bearer \(apiKey)",
            forHTTPHeaderField:
                "Authorization"
        )

        request.httpBody =
            try? JSONSerialization.data(
                withJSONObject: body
            )

        URLSession.shared.dataTask(
            with: request
        ) { data, response, error in

            if let error {

                DispatchQueue.main.async {

                    completion(
                        "Request failed: \(error.localizedDescription)"
                    )
                }

                return
            }

            guard let data else {

                DispatchQueue.main.async {

                    completion(
                        "No response received."
                    )
                }

                return
            }

            if let jsonString =
                String(
                    data: data,
                    encoding: .utf8
                ) {

                print(
                    "OPENROUTER RESPONSE:"
                )

                print(
                    jsonString
                )
            }

            do {

                let json =
                    try JSONSerialization
                    .jsonObject(
                        with: data
                    ) as? [String: Any]

                if let error =
                    json?["error"]
                    as? [String: Any] {

                    let message =
                        error["message"]
                        as? String ??
                        "Unknown error"

                    DispatchQueue.main.async {

                        completion(
                            "AI Error: \(message)"
                        )
                    }

                    return
                }

                let content =
                    (((json?["choices"]
                    as? [[String: Any]])?
                    .first)?["message"]
                    as? [String: Any])?["content"]
                    as? String ?? ""

                DispatchQueue.main.async {

                    if content.isEmpty {

                        completion(
                            "No content returned from AI."
                        )

                    } else {

                        completion(
                            content
                        )
                    }
                }

            } catch {

                DispatchQueue.main.async {

                    completion(
                        "Failed to parse AI response."
                    )
                }
            }

        }.resume()
    }
}
