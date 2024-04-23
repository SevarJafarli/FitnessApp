//
//  SocialAccountViewCell.swift
//  FitnessAppMidtermProject
//
//  Created by Sevar Jafarli on 17.04.24.
//

import UIKit

class SocialAccountViewCell: UICollectionViewCell {
    private let view: ImageCircleView = {
        let view = ImageCircleView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
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
        contentView.addSubview(view)
    }
    
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: contentView.topAnchor),
            view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            view.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
      
    }
    
    public func configure(with model: GymSocialMediaModel) {
        view.configure(with: .init(title: nil, image: model.icon, imageColor: .white, bgColor: .primary.withAlphaComponent(0.8)))
    }

}
