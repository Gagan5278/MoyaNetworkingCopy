//
//  UserEndPoint.swift
//  MoyaNetworking
//
//  Created by Gagan Vishal  on 2023/07/27.
//

import Foundation

enum PostEndPoint: APIEndPoint {
    case getAllPosts
    case getPost(id: Int)
    case createUser(userId: Int, title: String, body: String)
    case deletePost(id: Int)
    
    var path: String {
        switch self {
        case .getAllPosts:
            return "/posts"
        case .getPost(let id):
            return "/posts/\(id)"
        case .createUser:
            return "/posts"
        case .deletePost(let id):
            return "/posts/\(id)"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getAllPosts, .getPost:
            return .get
        case .createUser:
            return .post
        case .deletePost:
            return .delete
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .createUser:
            return  ["Content-type": "application/json; charset=UTF-8"]
        default:
            return nil
        }
    }
    
    var parameters: [String : Any]? {
        switch self {
        case .createUser(let userId, let title, let body):
            return ["title":  title, "body": body, "userId": "\(userId)"]
        default:
            return nil
        }
    }
    
    var baseURL: URL? {
       URL(string: "https://jsonplaceholder.typicode.com")
    }
}
