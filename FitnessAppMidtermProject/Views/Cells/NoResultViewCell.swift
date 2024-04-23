//
//  NoResultViewCell.swift
//  FitnessAppMidtermProject
//
//  Created by Sevar Jafarli on 19.04.24.
//

import UIKit

class NoResultViewCell: UITableViewCell {

    private let contentStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.alignment = .center
        sv.spacing = 16
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    private let notFoundimageView: UIImageView = {
        let imgView = UIImageView(image: .notFound)
        imgView.tintColor = .primary
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    
    private let subtitleLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "We couldn't find what you are looking for"
        lbl.numberOfLines = 0
        lbl.textAlignment  = .center
        lbl.font = .systemFont(ofSize: 22, weight: .semibold)
        lbl.textColor = .systemGray
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
  
    //MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
        addSubviews()
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    
    private func addSubviews() {
        contentView.addSubview(contentStackView)
        contentStackView.addArrangedSubview(notFoundimageView)
        contentStackView.addArrangedSubview(subtitleLabel)
    }
    
    
    private func addConstraints() {
        
        NSLayoutConstraint.activate([
    
            contentStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            contentStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            contentStackView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            contentStackView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            notFoundimageView.widthAnchor.constraint(equalToConstant: 100),
            notFoundimageView.heightAnchor.constraint(equalToConstant: 100),
        ])
    }
}
