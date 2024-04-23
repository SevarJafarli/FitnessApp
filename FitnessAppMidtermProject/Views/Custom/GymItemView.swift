//
//  GymItemView.swift
//  FitnessAppMidtermProject
//
//  Created by Sevar Jafarli on 14.04.24.
//

import UIKit

class GymItemView: UIView {
    
    //MARK: Init
    
    private let imgView: UIImageView = {
        let imgView = UIImageView()
        imgView.layer.cornerRadius = 16
        imgView.clipsToBounds = true
        imgView.image = .fitness
        imgView.contentMode = .scaleToFill
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.backgroundColor = .gray
        return imgView
    }()
    
    private let titleLbl: UILabel = {
        let lbl = UILabel()
        lbl.text = "Arslan Fitness Merkezi razin kucesi fhsjsj djjjdjdj"
        lbl.font = .systemFont(ofSize: 20, weight: .semibold)
        lbl.textColor = .white
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private let rateView: GymStarRateView = {
        let view = GymStarRateView()
        view.setRate(4.5)
        return view
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func addSubviews() {
        
        self.addSubview(imgView)
//        imgView.addSubview(gradientView)
        imgView.addSubview(rateView)
        imgView.addSubview(titleLbl)
       
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            imgView.topAnchor.constraint(equalTo: topAnchor),
            imgView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imgView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imgView.bottomAnchor.constraint(equalTo:bottomAnchor),
            
            rateView.topAnchor.constraint(equalTo: imgView.topAnchor, constant: 12),
            rateView.trailingAnchor.constraint(equalTo: imgView.trailingAnchor, constant: -12),
            
            titleLbl.leadingAnchor.constraint(equalTo: imgView.leadingAnchor, constant: 12),
            titleLbl.trailingAnchor.constraint(equalTo: imgView.trailingAnchor, constant: -12),
            titleLbl.bottomAnchor.constraint(equalTo: imgView.bottomAnchor, constant: -12)
            
        ])
        
    }
    
    public func configure(with model: GymModel) {
        self.titleLbl.text = model.gymName
        self.rateView.setRate(model.rating)
        self.imgView.image = UIImage(named: model.gymImage)
    }
}
