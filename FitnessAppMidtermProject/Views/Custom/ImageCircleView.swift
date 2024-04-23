//
//  ImageCircleView.swift
//  FitnessAppMidtermProject
//
//  Created by Sevar Jafarli on 17.04.24.
//

import UIKit


class ImageCircleView: UIView {
    
    struct Model {
        let title: String?
        let image: UIImage?
        let imageColor: UIColor?
        let bgColor: UIColor?
    }
    
    private let stackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.spacing = 2
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    private let roundView: UIView = {
        let view = UIView(frame: .init(x: 0, y: 0, width: 72, height: 72))
        view.layer.cornerRadius = view.frame.height / 2
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
   
    private let imageView: UIImageView = {
        let imgView = UIImageView()
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    
    private let titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.textAlignment = .center
        lbl.numberOfLines = 2
        lbl.font = .systemFont(ofSize: 15, weight: .regular)
        lbl.textColor = .label.withAlphaComponent(0.7)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    //MARK: - Init
    
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
        stackView.addArrangedSubview(roundView)
        stackView.addArrangedSubview(titleLabel)
        addSubview(stackView)
    }
    
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
        
            roundView.widthAnchor.constraint(equalToConstant: 72),
            roundView.heightAnchor.constraint(equalToConstant: 72),
            
            imageView.widthAnchor.constraint(equalToConstant: 48),
            imageView.heightAnchor.constraint(equalToConstant: 48),
            imageView.centerYAnchor.constraint(equalTo: roundView.centerYAnchor),
            imageView.centerXAnchor.constraint(equalTo: roundView.centerXAnchor),
        
        ])
      
    }
    
    public func configure(with model: Model) {
        titleLabel.text = model.title
        imageView.image = model.image
        imageView.tintColor = model.imageColor
        roundView.backgroundColor = model.bgColor
    }
}
