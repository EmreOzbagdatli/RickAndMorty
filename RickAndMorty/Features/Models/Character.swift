//
//  CharacterModel.swift
//  RickAndMorty
//
//  Created by Emre Özbağdatlı on 22.08.2023.
//

import Foundation

struct Character: Identifiable, Decodable, Equatable, Hashable {
    let location: Location
    let id: Int
    let name: String
    let species: String
    let image: String
    let gender: Gender
    let status: Status
    let type: String

    enum Gender: String, Decodable {
        case Female = "Female"
        case Male = "Male"
        case Genderless = "Genderless"
        case unknown = "unknown"
    }
    enum Status: String, Decodable {
        case Alive = "Alive"
        case Dead = "Dead"
        case unknown = "unknown"
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    static func == (lhs: Character, rhs: Character) -> Bool {
        lhs.id == rhs.id
    }
}

struct Location: Decodable {
    let name: String
}

struct CharacterListResponse: Decodable {
    let results: [Character]
    let info: CharacterInfo
}

struct CharacterInfo: Decodable {
    let count: Int
    let pages: Int?
    let next: String?
    let prev: String?

}


