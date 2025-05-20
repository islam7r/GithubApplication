//
//  BaseButton.swift
//  GithubApplication
//
//  Created by Rzayev Islam on 20.05.25.
//

import UIKit


class BaseButton: UIButton{
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .blue
        layer.borderWidth = 1
        layer.borderColor = UIColor.systemBlue.cgColor
        setTitleColor(.white, for: .normal)
        
        snp.makeConstraints { make in
            make.height.equalTo(40)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


#Preview{
    ViewController()
}
