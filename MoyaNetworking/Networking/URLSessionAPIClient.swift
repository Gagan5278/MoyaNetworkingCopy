//
//  URLSessionAPIClient.swift
//  MoyaNetworking
//
//  Created by Gagan Vishal  on 2023/07/27.
//

import Foundation
import Combine

class URLSessionAPIClient<EndPointType: APIEndPoint>: APIClient {
    
    func request<T>(_ endPoint: EndPointType, type: T.Type) -> AnyPublisher<T, Error> where T : Decodable {
        guard let url = endPoint.baseURL?.appendingPathComponent(endPoint.path) else {
            return Fail(error: APIError.invalidURL).eraseToAnyPublisher()
        }
        // Reequest
        var request = URLRequest(url: url)
        request.httpMethod = endPoint.method.rawValue
        // headers if any
        endPoint.headers?.forEach { request.addValue($0.value, forHTTPHeaderField: $0.key)}
        
        // Request
        return URLSession.shared.dataTaskPublisher(for: request)
            .subscribe(on: DispatchQueue.global(qos: .background))
            .tryMap { data, response -> Data in
                guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                    throw APIError.invalidResponse
                }
                return data
            }
            .decode(type: T.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
    
}
