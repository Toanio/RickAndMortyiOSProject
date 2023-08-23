//
//  APIManager.swift
//  RickAndMortyiOSProject
//
//  Created by c.toan on 22.08.2023.
//

import Foundation
import UIKit

enum ApiType {
    case getCharacter
    case getLocation
    case getEpisodes
    
    var baseURL: String {
        return "https://rickandmortyapi.com/api/"
    }
    
    var path: String {
        switch self {
        case .getCharacter: return "character"
        case .getLocation: return "location"
        case .getEpisodes: return "episode"
        }
    }
    
    var request: URLRequest {
        guard let url = URL(string: path, relativeTo: URL(string: baseURL) ) else { fatalError() }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        return request
    }
}

class APIManager {
    
    static let shared = APIManager()
    
    func getCharacter(complition: @escaping (Character) -> Void) {
        let  request = ApiType.getCharacter.request
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data, let character = try? JSONDecoder().decode(Character.self, from: data) {
                complition(character)
            } 
        }
        task.resume()
    }
    
    func getImage(url: String, complition: @escaping (Data) -> Void) {
        let request = URL(string: url)!
        let task = URLSession.shared.dataTask(with: URLRequest(url: request)) { data, response, error in
            guard let data = data, error == nil else { return }
            complition(data)
        }
        task.resume()
    }
    
    func getEpisode(url: String, complition: @escaping ([EpisodeResult]) -> Void) {
        let  request = URL(string: url)!
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data, let character = try? JSONDecoder().decode(Episode.self, from: data) {
                complition(character.results)
            }
        }
        task.resume()
    }
    
    
}

