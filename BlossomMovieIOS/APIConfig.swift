//
//  APIConfig.swift
//  BlossomMovieIOS
//
//  Created by Troy Fitzgerald on 1/19/26.
//  About: Used for read & access to contents (api keys etc) inside APIConfig file at run time into our app
//

import Foundation

// APIConfig represents all external API-related configuration
// needed by the application. This data is intentionally loaded
// from a JSON file at runtime instead of being hard-coded.
struct APIConfig: Decodable {
    let tmdbBaseURL: String
    let tmdbAPIKey: String
    
    // singleton pattern ; ensures that only one instance of API config is created
    static let shared: APIConfig? = {
        do {
            return try loadConfig()
        } catch {
            // Failing fast here ensures the app does not run
            // with invalid or missing configuration.
            print("Failed to load API configuration: \(error).localizedDescription")
            return nil
        }
    }()
    
    // - - - - FUNCTIONS - - - -
    
    // Loads API configuration from APIConfig.json in the app bundle.
    //
    // - Why static:
    //   This method belongs to the type itself and is used to
    //   create an APIConfig instance before one exists.
    //
    // - Why private:
    //   Configuration loading is an internal implementation detail
    //   and should not be triggered arbitrarily from outside this file.
    //
    // - Why throws:
    //   Any failure (missing file, invalid JSON, decoding issues)
    //   is propagated to the caller so it can be handled explicitly.
    private static func loadConfig() throws -> APIConfig {
        
        // Locate APIConfig.json inside the app bundle
        guard let URL = Bundle.main.url(forResource: "APIConfig", withExtension: "json") else { // ensures we cant proceed w/o JSON file
            throw APIConfigError.fileNotFound
        }
        
        do {
            let data = try Data(contentsOf: URL) // read the raw contents of the JSON file into memory
            // Decode the JSON data into an APIConfig instance.
                // JSONDecoder works together with Decodable to:
                //  - Map JSON keys to struct properties
                //  - Enforce correct types
                //  - Fail automatically if the structure is invalid
            return try JSONDecoder().decode(APIConfig.self, from: data)
        } catch let error as DecodingError {
            throw APIConfigError.decodingFailed(underlyingError: error)
        } catch {
            throw APIConfigError.dataLoadingFailed(underlyingError: error)
        }
    }
}
