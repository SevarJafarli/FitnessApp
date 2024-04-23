//
//  GymSocialAccountsViewCell.swift
//  FitnessAppMidtermProject
//
//  Created by Sevar Jafarli on 17.04.24.
//

import UIKit

class GymSocialAccountsViewCell: UITableViewCell {
    
    var models: [GymSocialMediaModel] = []{
        didSet {
            collectionView.reloadData()
        }
    }
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = .init(width: 72, height: 72)
        layout.minimumLineSpacing = 16
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.contentInset = .init(top: 0, left: 16, bottom: 0, right: 16)
        cv.backgroundColor = .clear
        cv.showsHorizontalScrollIndicator = false
        cv.translatesAutoresizingMaskIntoConstraints = false
        
        cv.register(SocialAccountViewCell.self, forCellWithReuseIdentifier: SocialAccountViewCell.reuseIdentifier)
        cv.dataSource = self
        return cv
    }()
    
    
    
    //MARK: Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .clear
        self.addSubviews()
        self.addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    
    private func addSubviews() {
        contentView.addSubview(collectionView)
    }
    
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 72)
            
        ])
    }

}


extension GymSocialAccountsViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        models.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SocialAccountViewCell.reuseIdentifier, for: indexPath) as! SocialAccountViewCell
        
        let model = models[indexPath.row]
        cell.configure(with: model)
        return cell
    }
}

