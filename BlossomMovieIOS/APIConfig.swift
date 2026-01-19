//
//  APIConfig.swift
//  BlossomMovieIOS
//
//  Created by Troy Fitzgerald on 1/19/26.
//  About: Used for read & access to contents (api keys etc) inside APIConfig file at run time into our app
//

import Foundation

struct APIConfig: Decodable {
    let tmdbBaseURL: String
    let tmdbAPIKey: String
    
    // singleton pattern ; ensures that only one instance of API config is created
    static let shared: APIConfig = {
        guard let URL = Bundle.main.url(forResource: "APIConfig", withExtension: "json") else { // ensures we cant proceed w/o JSON file
            fatalError("APIConfig.json is missing or invalid")
        }
        
        do {
            let data = try Data(contentsOf: URL)
            return try JSONDecoder().decode(APIConfig.self, from: data)
        }
        catch {
            fatalError("Failed to load or decode APIConfig.json: \(error)")
        }
    }()
}
