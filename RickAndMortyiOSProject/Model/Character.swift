//
//  Character.swift
//  RickAndMortyiOSProject
//
//  Created by c.toan on 22.08.2023.
//

import Foundation

// MARK: - Character
struct Character: Codable {
    let info: Info?
    let results: [CharacterResult]
}

// MARK: - Info
struct Info: Codable {
    let count, pages: Int?
    let next: String?
}

// MARK: - Result
struct CharacterResult: Codable {
    let id: Int?
    let name, status, species, type: String?
    let gender: String?
    let origin, location: Location?
    let image: String?
    let episode: [String]
    let url: String?
    let created: String?
    
        
}

// MARK: - Location
struct Location: Codable {
    let name: String?
    let url: String?
}

