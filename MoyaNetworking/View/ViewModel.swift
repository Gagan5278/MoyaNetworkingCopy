//
//  ViewModel.swift
//  MoyaNetworking
//
//  Created by Gagan Vishal  on 2023/07/27.
//

import SwiftUI
import Combine

class ViewModel: ObservableObject {
    
    let apiClient = URLSessionAPIClient<PostEndPoint>()
    var cancellable = Set<AnyCancellable>()
    
    // MARK: - init
    init() { }
    
    func getAllPosts() {
        apiClient.request(PostEndPoint.getAllPosts, type: [Post].self)
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print(error)
                }
            } receiveValue: { posts in
                print(posts)
            }
            .store(in: &cancellable)
    }
    
    func getPostForID() {
        apiClient.request(PostEndPoint.getPost(id: 1), type: Post.self)
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print(error)
                }
            } receiveValue: { posts in
                print(posts)
            }
            .store(in: &cancellable)
    }
    
    func deletePost() {
        apiClient.request(PostEndPoint.deletePost(id: 1), type: Post.self)
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print(error)
                }
            } receiveValue: { posts in
                print(posts)
            }
            .store(in: &cancellable)
    }
    
    func createPost() {
        apiClient.request(PostEndPoint.createUser(userId: 1, title: "John", body: "Test"), type: Post.self)
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print(error)
                }
            } receiveValue: { posts in
                print(posts)
            }
            .store(in: &cancellable)
    }
}
