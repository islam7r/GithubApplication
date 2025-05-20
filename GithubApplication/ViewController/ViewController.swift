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

    override func viewDidLoad() {
        super.viewDidLoad()
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
       
    }


}

#Preview{
    ViewController()
}

