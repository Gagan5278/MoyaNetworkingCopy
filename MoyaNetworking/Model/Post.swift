//
//  Post.swift
//  MoyaNetworking
//
//  Created by Gagan Vishal  on 2023/07/27.
//

import Foundation

struct Post: Codable {
    let userId, id: Int?
    let title, body: String?

    enum CodingKeys: String, CodingKey {
        case userId, id, title, body
    }
}
