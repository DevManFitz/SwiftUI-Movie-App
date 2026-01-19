//
//  Title.swift
//  BlossomMovieIOS
//
//  Created by Troy Fitzgerald on 1/18/26.
//

import Foundation

struct APIObject: Decodable {
    var results: [Title] = []
}
struct Title: Decodable, Identifiable {
    // "?" marks the values as optionals in swift (good practice for api data; values we dont manage)
    var id: Int?
    var title: String?
    var name: String?
    var overview: String?
    var posterPath: String?
}
