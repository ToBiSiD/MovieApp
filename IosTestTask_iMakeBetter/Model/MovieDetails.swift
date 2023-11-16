//
//  MovieDetails.swift
//  IosTestTask_iMakeBetter
//
//  Created by Tobias on 15.11.2023.
//

import Foundation

struct MovieDetails: Decodable {
    let adult: Bool
    let backdropPath: String?
    let genres: [Genre]
    let id: Int
    let originalLanguage: String
    let originalTitle: String
    let overview: String
    let popularity: Double
    let posterPath: String?
    let productionCountries: [ProductionCountry]
    let releaseDate: String
    let runtime: Int
    let spokenLanguages: [SpokenLanguage]
    let status: String
    let tagline: String?
    let title: String
    let voteAverage: Double
    let voteCount: Int

    struct Genre: Decodable {
        let name: String
    }

    struct ProductionCountry: Decodable {
        let name: String
    }

    struct SpokenLanguage: Decodable {
        let name: String
    }

    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case genres
        case id
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview
        case popularity
        case posterPath = "poster_path"
        case productionCountries = "production_countries"
        case releaseDate = "release_date"
        case runtime
        case spokenLanguages = "spoken_languages"
        case status
        case tagline
        case title
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}

extension MovieDetails {
    var allGenre: String {
        let result = genres.map({ $0.name }).joined(separator: ", ")
        return result.isEmpty ? "Unknown" : result
    }
    
    var releaseYear: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        if let date = dateFormatter.date(from: releaseDate) {
            let year = Calendar.current.component(.year, from: date)
            return "\(year)"
        }
        
        return "Unknown"
    }
    
    var duration: String {
        let hours = runtime / 60
        let minutes = runtime % 60
        
        return "\(hours)h \(minutes)m"
    }
    
    var imagePath: String {
        "https://image.tmdb.org/t/p/w500\(backdropPath ?? "")"
    }
    
    var languages: String {
        let result = spokenLanguages.map { $0.name }.joined(separator: ", ")
        return result.isEmpty ? "Unknown" : result
    }
    
    var countries: String {
        let result = productionCountries.map { $0.name }.joined(separator: ", ")
        return result.isEmpty ? "Unknown" : result
    }
}
