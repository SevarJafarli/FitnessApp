//
//  GymGeneralInfoViewCell.swift
//  FitnessAppMidtermProject
//
//  Created by Sevar Jafarli on 17.04.24.
//

import UIKit

class GymGeneralInfoViewCell: UITableViewCell {

    private let contentStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.spacing = 6
        sv.alignment = .leading
        sv.translatesAutoresizingMaskIntoConstraints  = false
        return sv
    }()
    
    private let nameLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = .systemFont(ofSize: 24, weight: .bold)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private let rateView: GymStarRateView = {
        let view = GymStarRateView()
        return view
    }()
    
    private let workingPeriodLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .label.withAlphaComponent(0.5)
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
        contentStackView.addArrangedSubview(nameLabel)
        contentStackView.addArrangedSubview(rateView)
        contentStackView.addArrangedSubview(workingPeriodLabel)
    }
    
    
    private func addConstraints() {
        
        NSLayoutConstraint.activate([
            contentStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            contentStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            contentStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            contentStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ])
    }
    
    public func configure(name: String, rate: Double, workingHours: String) {
        
        nameLabel.text = name
        rateView.setRate(rate)
        workingPeriodLabel.text = workingHours
    }
}
