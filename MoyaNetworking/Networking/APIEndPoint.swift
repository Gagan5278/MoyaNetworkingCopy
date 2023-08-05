//
//  APIEndPoint.swift
//  MoyaNetworking
//
//  Created by Gagan Vishal  on 2023/07/27.
//

import Foundation

protocol APIEndPoint {
    var baseURL: URL? { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var headers: [String: String]? { get }
    var parameters: [String: Any]? { get }
}

extension APIEndPoint {
    var headers: [String: String]? {
        return nil
    }
    
    var parameters: [String: Any]? {
        return nil
    }
}
