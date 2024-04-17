//
//  GymItemCell.swift
//  FitnessAppMidtermProject
//
//  Created by Sevar Jafarli on 11.04.24.
//

import UIKit

class GymItemTableViewCell: UITableViewCell {
    
    
    
    private let gradientView: GradientView = {
        let view = GradientView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
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
            
//            
//            gradientView.leadingAnchor.constraint(equalTo: imgView.leadingAnchor),
//            gradientView.trailingAnchor.constraint(equalTo: imgView.trailingAnchor),
//            gradientView.bottomAnchor.constraint(equalTo: imgView.bottomAnchor),
//            gradientView.heightAnchor.constraint(equalToConstant: 120),
//
        ])
        
    }
    
    //MARK: - Public
    public func configure(with model: GymModel) {
        itemView.configure(with: model)
    }
}


class GradientView: UIView {
    override class var layerClass: AnyClass {
        return CAGradientLayer.self
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if let gradientLayer = layer as? CAGradientLayer {
            gradientLayer.colors = [UIColor.red.cgColor, UIColor.blue.cgColor] // Set your desired gradient colors
            gradientLayer.locations = [0.0, 1.0] // Start at the top
            gradientLayer.frame = bounds
        }
    }
}
