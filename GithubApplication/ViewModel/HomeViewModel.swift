//
//  HomeViewModel.swift
//  GithubApplication
//
//  Created by Rzayev Islam on 20.05.25.
//

import Foundation

protocol HomeViewModelProtocol{
    func render(state: HomeViewModelState)
}

enum HomeViewModelState{
    case loading
    case loaded(UserModel)
    case failure(Error)
}


class HomeViewModel{
    
    static let shared = HomeViewModel()
    
    private let networkManager = NetworkManager.instance
    var delegate: HomeViewModelProtocol?
    
    
    func getInfo(username: String){
        networkManager.getInfo(username: username) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let success):
                    self.delegate?.render(state: .loaded(success))
                case .failure(let failure):
                    self.delegate?.render(state: .failure(failure))
                }
            }
        }
    }
    
    func subscribe(_ delegate: HomeViewModelProtocol){
        self.delegate = delegate
    }
}
