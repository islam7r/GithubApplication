//
//  ApiService.swift
//  GithubApplication
//
//  Created by Rzayev Islam on 20.05.25.
//

import Foundation

protocol ApiService{
    func getInfo(username: String, completion: @escaping (Result<UserModel, Error>) -> Void)
}
