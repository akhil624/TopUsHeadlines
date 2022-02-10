//
//  TopUsHeadlineResponse.swift
//  News
//
//  Created by Akhilesh Kumar Singh on 08/02/22.
//

import Foundation

// MARK: - TopUsHeadlineResponse
struct TopUsHeadlineResponse: Codable {
    let status: String?
    let totalResults: Int?
    let articles: [Article]?
}

// MARK: - Article
struct Article: Codable {
    let source: Source?
    let author: String?
    let title, description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String?
    let content: String?
}

// MARK: - Source
struct Source: Codable {
    let id: String?
    let name: String?
}
