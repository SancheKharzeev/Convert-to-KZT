//
//  SetText.swift
//  Convert to KZT
//
//  Created by Александр Х on 21.03.2023.
//

import UIKit

class SetText: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setLabelText()
        widthText()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setLabelText()
        widthText()
      
    }
    
    
    func setLabelText() {
        textColor = .systemYellow
        font = UIFont(name: "Apple SD Gothic Neo Bold", size: 20)
        textAlignment = .right
        
    }
    
    func widthText() {
        translatesAutoresizingMaskIntoConstraints = false // обязательное условие отключения автолейаут
        NSLayoutConstraint.activate([
      //  widthAnchor.constraint(equalToConstant: 100),
      //  heightAnchor.constraint(equalToConstant: 50),
        
        ])
    }
    
    
}
