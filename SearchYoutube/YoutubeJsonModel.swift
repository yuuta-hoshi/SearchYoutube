//
//  YoutubeJsonModel.swift
//  SearchYoutube
//
//  Created by 星優大 on 2023/02/20.
//

import Foundation

struct Results: Codable {
    let items: [Item]
}

struct Item: Codable, Identifiable {
    let id: String
    let vid: VID
    let snippet: Snippet
    
    enum CodingKeys: String, CodingKey {
        case id = "etag"
        case vid = "id"
        case snippet
    }
}

struct VID: Codable{
    let videoId: String
}

struct Snippet: Codable {
    let title, description: String
    let thumbnails: Thumbnails
}

struct Thumbnails: Codable {
    let `default`: Thumbnail
}

struct Thumbnail: Codable {
    let url: String
}
