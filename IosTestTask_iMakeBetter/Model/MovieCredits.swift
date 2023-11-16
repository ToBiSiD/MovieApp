//
//  MovieCredits.swift
//  IosTestTask_iMakeBetter
//
//  Created by Tobias on 15.11.2023.
//

import Foundation

struct MovieCredits: Decodable {
    let id: Int
    let cast: [Cast]
    let crew: [Cast]
}

extension MovieCredits {
    var creators: [Cast] {
        cast.filter({ $0.isCreator })
    }
}

// MARK: - Cast
struct Cast: Decodable, Hashable {
    let knownForDepartment: Department
    let name: String
    let originalName: String
    let profilePath: String?
    let character: String?
    let job: String?

    enum CodingKeys: String, CodingKey {
        case knownForDepartment = "known_for_department"
        case name
        case originalName = "original_name"
        case profilePath = "profile_path"
        case character
        case job
    }
    
    var isCreator: Bool {
        knownForDepartment == .directing
    }
    
    var imagePath: String {
        "https://image.tmdb.org/t/p/w500\(profilePath ?? "")"
    }
}

enum Department: String, Codable {
    case acting = "Acting"
    case art = "Art"
    case camera = "Camera"
    case costumeMakeUp = "Costume & Make-Up"
    case crew = "Crew"
    case directing = "Directing"
    case editing = "Editing"
    case lighting = "Lighting"
    case production = "Production"
    case sound = "Sound"
    case visualEffects = "Visual Effects"
    case writing = "Writing"
}
