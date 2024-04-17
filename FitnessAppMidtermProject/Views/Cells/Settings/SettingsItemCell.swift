//
//  SettingsItemCell.swift
//  FitnessAppMidtermProject
//
//  Created by Sevar Jafarli on 11.04.24.
//

import UIKit

class SettingsItemCell: UITableViewCell {
    
    private let contentStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.spacing = 0
        sv.distribution = .equalSpacing
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    private let leftStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.spacing = 12
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    private let settingsImageView: UIImageView = {
        let imgView = UIImageView()
        imgView.tintColor = .primary
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    
    private let titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .label
        lbl.font = .systemFont(ofSize: 18, weight: .semibold)
        return lbl
    }()
    
    private let rightImageView: UIImageView = {
        let imgView = UIImageView()
        imgView.tintColor = .systemGray
        imgView.image = .arrowRight
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    
    
    //MARK: Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .clear
        self.selectionStyle = .none
        addSubviews()
        addConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError()
    }
    
    
    
    private func addSubviews() {
        contentView.addSubview(contentStackView)
        contentStackView.addArrangedSubview(leftStackView)
        leftStackView.addArrangedSubview(settingsImageView)
        leftStackView.addArrangedSubview(titleLabel)
        contentStackView.addArrangedSubview(rightImageView)
    }
    
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            contentStackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            contentStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            contentStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            contentStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -24),
            
            settingsImageView.widthAnchor.constraint(equalToConstant: 24),
            settingsImageView.heightAnchor.constraint(equalToConstant: 24),
            
            rightImageView.widthAnchor.constraint(equalToConstant: 24),
            rightImageView.heightAnchor.constraint(equalToConstant: 24),
        ])
       
    }
    
    
    //MARK: Public
    
    public func configure(with model: SettingsModel) {
        self.settingsImageView.image = model.image
        self.titleLabel.text = model.title
    }
}
