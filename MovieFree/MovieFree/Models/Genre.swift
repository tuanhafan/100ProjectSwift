//
//  Genre.swift
//  MovieFree
//
//  Created by Alex Tran on 23/4/25.
//

import Foundation

struct GenreResponse: Codable {
    let genres: [Genre]
}

struct Genre: Codable {
    let id: Int
    let name: String
}
