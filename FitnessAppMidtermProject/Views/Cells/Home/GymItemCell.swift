//
//  GymItemCell.swift
//  FitnessAppMidtermProject
//
//  Created by Sevar Jafarli on 11.04.24.
//

import UIKit

class GymItemTableViewCell: UITableViewCell {
    
    private let itemView: GymItemView = {
        let view = GymItemView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    //MARK: İnit
    
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
        
        self.contentView.addSubview(itemView)
    }
    
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            itemView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            itemView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            itemView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            itemView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
        ])
        
    }
    
    //MARK: - Public
    public func configure(with model: GymModel) {
        itemView.configure(with: model)
    }
}


//MARK: - Constants

extension GymItemTableViewCell {
    
    struct Constants {
        static let cellHeight = 240.0
    }
}
