//
//  MovieVideos.swift
//  IosTestTask_iMakeBetter
//
//  Created by Tobias on 15.11.2023.
//

import Foundation

struct MovieVideos: Decodable {
    let id: Int
    let results: [MovieVideo]
}

struct MovieVideo: Decodable, Hashable {
    let name: String
    let key: String
    let type: String
    let official: Bool
    let publishedAt: String

    enum CodingKeys: String, CodingKey {
        case name
        case key
        case type
        case official
        case publishedAt = "published_at"
    }
}

extension MovieVideo {
    var trailerURL: String {
        "https://www.youtube.com/embed/\(key)"
    }
    
    var publishedDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        if let date = dateFormatter.date(from: publishedAt) {
            return date.formatted(Date.FormatStyle().year().month().day())
        }
        
        return "No date"
    }
}
