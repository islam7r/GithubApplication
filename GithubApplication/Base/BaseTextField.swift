//
//  BaseTextField.swift
//  GithubApplication
//
//  Created by Rzayev Islam on 20.05.25.
//

import UIKit
 

class BaseTextField : UITextField {
    

    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .red
        textColor = .white
        layer.borderWidth = 1
        textAlignment = .center
        layer.borderColor = UIColor.systemRed.cgColor
        
        attributedPlaceholder = NSAttributedString(
            string: placeholder ?? "null",
            attributes: [
                NSAttributedString.Key.foregroundColor: UIColor.white
            ])
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
