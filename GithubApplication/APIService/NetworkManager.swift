//
//  NetworkManager.swift
//  GithubApplication
//
//  Created by Rzayev Islam on 20.05.25.
//

import Foundation

class NetworkManager{
    
    static let instance = NetworkManager(apiService: URLSessionAdapter())
    
    private var apiService: ApiService?
    
    init(apiService: ApiService? = nil) {
        self.apiService = apiService
    }
    
    
    func getInfo(userName: String, completion: @escaping (Result<UserModel, Error>) -> Void){
        apiService?.getInfo(userName: userName, completion: completion)
    }
    
    
    
    
}
