//
//  Photo.swift
//  SimplePhotos
//
//  Created by Le Huang on 11/9/22.
//

import Foundation

struct Photo: Codable, Hashable {
    let albumId: Int
    let id: Int
    let title: String
    let url: String
    let thumbnailUrl: String
}
