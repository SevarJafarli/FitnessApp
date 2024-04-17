//
//  HomeSectionHeaderView.swift
//  FitnessAppMidtermProject
//
//  Created by Sevar Jafarli on 14.04.24.
//

import UIKit

final internal class HomeSectionHeaderView: UIView {
    
    let title: String
    
    private let titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = .systemFont(ofSize: 20, weight: .bold)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    //MARK: Init
    init(title: String) {
        self.title = title
        super.init(frame: .zero)
        titleLabel.text = title
        addSubviews()
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    
    private func addSubviews() {
        self.addSubview(titleLabel)
    }
    
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8)
        ])
    }
    
    
}
