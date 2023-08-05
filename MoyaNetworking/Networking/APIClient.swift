//
//  APIClient.swift
//  MoyaNetworking
//
//  Created by Gagan Vishal  on 2023/07/27.
//

import Foundation
import Combine

protocol APIClient {
    associatedtype EndPointType: APIEndPoint
    func request<T: Decodable>(_ endPoint: EndPointType, type: T.Type) -> AnyPublisher<T, Error>
}
