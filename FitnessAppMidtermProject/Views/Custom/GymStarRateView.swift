//
//  GymStarRateView.swift
//  FitnessAppMidtermProject
//
//  Created by Sevar Jafarli on 14.04.24.
//

import UIKit

class GymStarRateView: UIView {
    
    private let stackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.spacing = 4
        sv.alignment = .center
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    private let starImageView: UIImageView = {
        let imgView = UIImageView()
        imgView.image = .star
        imgView.tintColor = .yellow
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    
    private let rateLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .systemGray5
        lbl.font = .systemFont(ofSize: 16, weight: .semibold)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    //MARK: Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        addSubviews()
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setupView() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.layer.cornerRadius = 8
        self.backgroundColor = .systemGray2
    }
    
    private func addSubviews() {
        addSubview(stackView)
        stackView.addArrangedSubview(starImageView)
        stackView.addArrangedSubview(rateLabel)
    }
    
    private func addConstraints() {
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 4),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -4),
            
            starImageView.widthAnchor.constraint(equalToConstant: 16),
            starImageView.heightAnchor.constraint(equalToConstant: 16),
        ])
    }
    
    public func setRate(_ rate: Double) {
        self.rateLabel.text = "\(rate)"
    }
}
