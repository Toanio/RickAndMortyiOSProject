//
//  Episode.swift
//  RickAndMortyiOSProject
//
//  Created by c.toan on 22.08.2023.
//

import Foundation

struct Episode: Codable {
    let info: EpisodeInfo?
    let results: [EpisodeResult]
}

// MARK: - Info
struct EpisodeInfo: Codable {
    let count, pages: Int?
    let next: String?
}

// MARK: - Result
struct EpisodeResult: Codable {
    let id: Int?
    let name: String?
    let episode: [String]
    let url: String?
    let created: String?
}



