//
//  RedditData.swift
//  Reddiget
//
//  Created by Christyan Huber Duarte Ibanez on 07/04/21.
//

import Foundation

struct RedditData: Decodable {
    
    let data: ListingData
}

struct ListingData: Decodable {
    
    let children: [Entry]
    let after: String?
    let before: String?
}

struct Entry: Decodable {
    
    let data: EntryData
}

struct EntryData: Decodable {
    let title: String
    let author: String
    let created: TimeInterval
    let thumbnail: String
    let numComments: Int
    let visited: Bool
}
