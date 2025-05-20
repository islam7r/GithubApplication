//
//  ViewController.swift
//  GithubApplication
//
//  Created by Rzayev Islam on 19.05.25.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    private let topVerticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = 20
        return stackView
    }()
    
    private let searchTextField: BaseTextField = {
        let textField = BaseTextField()
        textField.placeholder = "Write username here"
        textField.autocapitalizationType = .none
        return textField
    }()
    
    private let searchButton: BaseButton = {
        let button = BaseButton(type: .system)
        button.setTitle("Search", for: .normal)
        
        return button
    }()
    
    
    private let bioVerticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.spacing = 10
        return stackView
    }()
    
    private let ProfileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(systemName: "person.circle")
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private let usernameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Username"
        label.textColor = .white
        return label
    }()
    private let bioLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Bio"
        label.textColor = .white
        return label
    }()
    
    private let bioContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.borderWidth = 1
        return view
    }()
    
    private let horizontalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.alignment = .center
        stackView.spacing = 10
        return stackView
    }()
    
    private let followersLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Followers"
        label.textAlignment = .center
        label.numberOfLines = 0
        
        label.textColor = .white
        return label
    }()
    
    private let followingLabel: UILabel  = {
        let label = UILabel()
        
        label.text = "Following"
        label.numberOfLines = 0
        
        
        
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    private let publicReposLabel: UILabel = {
        let label = UILabel()
        label.text = "Public Repos"
        label.textColor = .white
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    private var viewModel = HomeViewModel.shared
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.subscribe(self)
        
        searchButton.addTarget(self, action: #selector(didSearchButtonTapped), for: .touchUpInside)
        
        setupViews()
    }
    
    @objc private func didSearchButtonTapped(){
        viewModel.getInfo(username: searchTextField.text ?? "")
        
    }
    
    private func setupViews() {
        view.backgroundColor = .black.withAlphaComponent(0.9)
        
        view.addSubview(topVerticalStackView)
        
        topVerticalStackView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(30)
            make.horizontalEdges.equalToSuperview().inset(16)
        }
        topVerticalStackView.addArrangedSubview(searchTextField)
        topVerticalStackView.addArrangedSubview(searchButton)
        
        view.addSubview(bioVerticalStackView)
        bioVerticalStackView.snp.makeConstraints { make in
            make.top.equalTo(topVerticalStackView.snp.bottom).offset(40)
            make.horizontalEdges.equalToSuperview().inset(16)
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-16)
        }
        
        bioVerticalStackView.addArrangedSubview(ProfileImageView)
        ProfileImageView.snp.makeConstraints { make in
            make.height.width.equalTo(200)
        }
        ProfileImageView.layer.cornerRadius = 100
        
        bioVerticalStackView.addArrangedSubview(usernameLabel)
        bioVerticalStackView.addArrangedSubview(bioLabel)
        bioVerticalStackView.addArrangedSubview(bioContainerView)
        bioContainerView.addSubview(horizontalStackView)
        horizontalStackView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(16)
            make.verticalEdges.equalToSuperview().inset(12)
        }
        
        horizontalStackView.addArrangedSubview(followersLabel)
        horizontalStackView.addArrangedSubview(followingLabel)
        horizontalStackView.addArrangedSubview(publicReposLabel)
        
        
    }
    
    
}

extension ViewController: HomeViewModelProtocol{
    func render(state: HomeViewModelState) {
        switch state {
        case .loading:
            print("loading")
        case .loaded(let userModel):
            DispatchQueue.main.async {
                self.usernameLabel.text = userModel.login
                self.followersLabel.text = "\(userModel.followers) Followers"
                self.followingLabel.text = "\(userModel.following) Following"
                self.publicReposLabel.text = "\(userModel.public_repos) Public Repos"
                print("userModel: ", userModel)
            }
        case .failure(let error):
            print("Error while fetching data: ", error.localizedDescription)
        }
    }
}


#Preview{
    ViewController()
}

