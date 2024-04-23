//
//  AppTextField.swift
//  FitnessAppMidtermProject
//
//  Created by Sevar Jafarli on 23.04.24.
//

import UIKit

class AppTextField: UITextField {
    
    //MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.cornerRadius = 16
        self.borderStyle = .roundedRect
        self.layer.borderColor = UIColor.unselectedBar.cgColor
        
        NSLayoutConstraint.activate([
            self.heightAnchor.constraint(equalToConstant: 56)
        ])
    }

    required init?(coder: NSCoder) {
        fatalError()
    }
}
