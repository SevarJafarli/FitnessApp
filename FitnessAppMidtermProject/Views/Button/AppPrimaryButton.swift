//
//  AppPrimaryButton.swift
//  FitnessAppMidtermProject
//
//  Created by Sevar Jafarli on 23.04.24.
//

import UIKit

class AppPrimaryButton: UIButton {

    
    //MARK: - Init

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .primary
        self.tintColor = .systemGray
        self.layer.cornerRadius = 12
        NSLayoutConstraint.activate([
            self.heightAnchor.constraint(equalToConstant: 56)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
