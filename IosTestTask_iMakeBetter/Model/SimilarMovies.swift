//
//  SimilarMovies.swift
//  IosTestTask_iMakeBetter
//
//  Created by Tobias on 15.11.2023.
//

import Foundation

// MARK: - SimilarMovies
struct SimilarMovies: Decodable {
    let results: [SimilarMovie]
}

struct SimilarMovie: Decodable, Hashable {
    let adult: Bool
    let id: Int
    let originalLanguage: String
    let originalTitle: String
    let popularity: Double
    let posterPath: String?
    let releaseDate: String
    let title: String
    let voteAverage: Double
    let voteCount: Int

    enum CodingKeys: String, CodingKey {
        case adult
        case id
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}

extension SimilarMovie {
    var imagePath: String {
        "https://image.tmdb.org/t/p/w500\(posterPath ?? "")"
    }
    
    var formattedRealeseDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        if let date = dateFormatter.date(from: releaseDate) {
            return date.formatted(Date.FormatStyle().year().month().day())
        }
        
        return ""
    }
}
