//
//  ContentView.swift
//  MoyaNetworking
//
//  Created by Gagan Vishal  on 2023/07/27.
//

import SwiftUI

struct ContentView: View {
    private let viewModel = ViewModel()
    
    var body: some View {
        VStack {
            Button("All Users: GET") {
                viewModel.getAllPosts()
            }
            .background(.green)
            .foregroundColor(.white)
            .frame(maxWidth: .infinity)
            .frame(height: 44)
            .background(.green)
            .cornerRadius(10)
            .padding()
            
            Button("Users ID 1: GET") {
                viewModel.getPostForID()
            }
            .background(.green)
            .foregroundColor(.white)
            .frame(maxWidth: .infinity)
            .frame(height: 44)
            .background(.green)
            .cornerRadius(10)
            .padding()
            
            Button("Create a user: POST") {
                viewModel.createPost()
            }
            .background(.green)
            .foregroundColor(.white)
            .frame(maxWidth: .infinity)
            .frame(height: 44)
            .background(.green)
            .cornerRadius(10)
            .padding()
            Button("Delete a user: DELETE") {
                viewModel.deletePost()
            }
            .background(.green)
            .foregroundColor(.white)
            .frame(maxWidth: .infinity)
            .frame(height: 44)
            .background(.green)
            .cornerRadius(10)
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
