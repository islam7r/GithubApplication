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
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = 20
        return stackView
    }()
    
    private let ProfileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(systemName: "person.circle")
       
        
        imageView.layer.masksToBounds = true
        imageView.backgroundColor = .red
        return imageView
    }()
    
    private let usernameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        return label
    }()
    private let bioLabel: UILabel = {
        let label = UILabel()
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
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.spacing = 8
        return stackView
    }()
    
    private let followersLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        return label
    }()
    
    private let followingLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        return label
    }()
    
    private let publicReposLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
       setupViews()
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

#Preview{
    ViewController()
}

