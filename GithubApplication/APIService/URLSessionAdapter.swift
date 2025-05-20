//
//  URLSessionAdapter.swift
//  GithubApplication
//
//  Created by Rzayev Islam on 20.05.25.
//

import Foundation


class URLSessionAdapter:ApiService{
    
    static let shared = URLSessionAdapter()
    
    func getInfo(username: String, completion: @escaping (Result<UserModel, Error>) -> Void){
        
        
        if let url = URL(string: "https://api.github.com/users/\(username)"){
            let request = URLRequest(url: url)
            
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                if let error = error{
                    completion(.failure(error))
                    return
                }
                guard let data = data else {
                    completion(.failure(NSError(domain: "", code: 0, userInfo: nil)))
                    return
                }
                do {
                    let decodedData = try JSONDecoder().decode(UserModel.self, from: data)
                    completion(.success(decodedData))
                } catch {
                    completion(.failure(error))
                }
            
            }
            task.resume()
        }
        
    }
    
}
