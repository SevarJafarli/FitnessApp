//
//  CategoriesViewCell.swift
//  FitnessAppMidtermProject
//
//  Created by Sevar Jafarli on 11.04.24.
//

import UIKit

protocol CategoriesViewCellDelegate: AnyObject {
    func onCellSelected(model: GymServiceModel)
}

class CategoriesViewCell: UITableViewCell {
    
    var services: [GymServiceModel] = []{
        didSet {
            collectionView.reloadData()
        }
    }
    
    weak var delegate: CategoriesViewCellDelegate?
    
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = .init(width: 72, height: 116)
        layout.minimumLineSpacing = 16
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.contentInset = .init(top: 16, left: 16, bottom: 16, right: 16)
        cv.backgroundColor = .clear
        cv.showsHorizontalScrollIndicator = false
        cv.translatesAutoresizingMaskIntoConstraints = false
        
        cv.register(CategoryItemCell.self, forCellWithReuseIdentifier: CategoryItemCell.reuseIdentifier)
        cv.dataSource = self
        cv.delegate = self
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
            collectionView.heightAnchor.constraint(equalToConstant: 116 + 32)
        ])
    }

}


extension CategoriesViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        services.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryItemCell.reuseIdentifier, for: indexPath) as! CategoryItemCell
        
        let service = services[indexPath.row]
        cell.configure(with: service)
        return cell
    }
}


extension CategoriesViewCell: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let service = services[indexPath.row]
        delegate?.onCellSelected(model: service)
    }
}
