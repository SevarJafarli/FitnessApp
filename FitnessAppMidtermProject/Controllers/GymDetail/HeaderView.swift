//
//  HeaderView.swift
//  FitnessAppMidtermProject
//
//  Created by Sevar Jafarli on 16.04.24.
//

import UIKit

final class HeaderView: UIView {
    public let imageView: UIImageView = {
        let imgView = UIImageView()
        imgView.clipsToBounds = true
        imgView.contentMode = .scaleAspectFill
        return imgView
    }()
    



    private var imageViewHeight = NSLayoutConstraint()
     var imageViewBottom = NSLayoutConstraint()
    private var containerView = UIView()
    private var containerViewHeight = NSLayoutConstraint()
    
    
    
    //MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func addSubviews() {
        addSubview(containerView)
        containerView.addSubview(imageView)
    }
    
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            widthAnchor.constraint(equalTo: containerView.widthAnchor),
            centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            heightAnchor.constraint(equalTo: containerView.heightAnchor),
        ])
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        containerView.widthAnchor.constraint(equalTo: imageView.widthAnchor).isActive = true
        
        
        containerViewHeight = containerView.heightAnchor.constraint(equalTo: self.heightAnchor)
        
        containerViewHeight.isActive = true
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        imageViewBottom = imageView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
        
        imageViewBottom.isActive = true
        
        imageViewHeight = imageView.heightAnchor.constraint(equalTo: containerView.heightAnchor)
        
        imageViewHeight.isActive = true
        
    }
    
    public func scrollViewDidScroll(_ scrollView: UIScrollView) {
        containerViewHeight.constant =  scrollView.contentInset.top
        let offsetY = -(scrollView.contentOffset.y + scrollView.contentInset.top)
        containerView.clipsToBounds = offsetY <= 0

        imageViewBottom.constant = offsetY >= 0 ? 0 : -offsetY / 2
        
        imageViewHeight.constant = max(offsetY + scrollView.contentInset.top, scrollView.contentInset.top)
       
    }
}
