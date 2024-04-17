//
//  CategoryItemCell.swift
//  FitnessAppMidtermProject
//
//  Created by Sevar Jafarli on 11.04.24.
//

import UIKit

class CategoryItemCell: UICollectionViewCell {
    
    private let roundView: UIView = {
        let view = UIView(frame: .init(x: 0, y: 0, width: 72, height: 72))
        view.backgroundColor = .blue
        view.layer.cornerRadius = view.frame.height / 2
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let imageView: UIImageView = {
        let imgView = UIImageView()
        imgView.image = .explore
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    
    private let titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Poodjdjjddj dhdd l"
        lbl.textAlignment = .center
        lbl.numberOfLines = 2
        lbl.font = .systemFont(ofSize: 15, weight: .regular)
        lbl.textColor = .label.withAlphaComponent(0.7)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    //MARK: Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubviews()
        
        self.addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    
    private func addSubviews() {
        roundView.addSubview(imageView)
        contentView.addSubview(roundView)
        contentView.addSubview(titleLabel)
    }
    
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            roundView.topAnchor.constraint(equalTo: contentView.topAnchor),
            roundView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            roundView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            roundView.widthAnchor.constraint(equalToConstant: 72),
            roundView.heightAnchor.constraint(equalToConstant: 72),
            
            imageView.widthAnchor.constraint(equalToConstant: 48),
            imageView.heightAnchor.constraint(equalToConstant: 48),
            imageView.centerYAnchor.constraint(equalTo: roundView.centerYAnchor),
            imageView.centerXAnchor.constraint(equalTo: roundView.centerXAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: roundView.bottomAnchor, constant: 2),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 2),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -2),
            titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
      
    }
    
    public func configure(with service: GymServiceModel) {
        titleLabel.text = service.serviceName
        imageView.image = UIImage(named: service.serviceImage)
        imageView.tintColor = UIColor(hex: service.imageColor)
        roundView.backgroundColor = UIColor(hex: service.bgColor)
    }
}
