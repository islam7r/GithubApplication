//
//  UserModel.swift
//  GithubApplication
//
//  Created by Rzayev Islam on 20.05.25.
//

import Foundation


struct UserModel: Decodable{
    let login: String
    let public_repos: Int
    let followers: Int
    let following: Int
}
