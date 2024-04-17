//
//  Cell+Ext.swift
//  FitnessAppMidtermProject
//
//  Created by Sevar Jafarli on 11.04.24.
//


import UIKit

public protocol CellConfigurer: AnyObject {
    static var reuseIdentifier: String {get}
}

public extension CellConfigurer {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

extension UICollectionViewCell: CellConfigurer { }
extension UITableViewCell: CellConfigurer { }



extension UITableViewCell {
    public func setupCell() {
        selectionStyle = .none
        backgroundColor = .clear
    }
}
