//
//  ViewController+Ext.swift
//  FitnessAppMidtermProject
//
//  Created by Sevar Jafarli on 14.04.24.
//

import UIKit

extension UIViewController {
    
    private struct AssociatedKeys {
        static var showBackButton = "ShowBackButton"
    }
    
    var showBackButton: Bool {
        get {
            guard let number = objc_getAssociatedObject(self, &AssociatedKeys.showBackButton) as? NSNumber else {
                return true
            }
            return number.boolValue
        }
        
        set(value) {
            objc_setAssociatedObject(self,&AssociatedKeys.showBackButton,NSNumber(value: value),objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            
            if value {
                self.addBackButton()
            } else {
                self.removeBackButton()
            }
        }
    }
    
    // MARK: - Private
    
    private func addBackButton() {
        let barBtnItem = UIBarButtonItem(
            image: UIImage.back.withTintColor(.label),
            style: .plain,
            target: self,
            action: #selector(popToPrevious)
        )
        
        barBtnItem.tintColor = .label
        navigationItem.leftBarButtonItem = barBtnItem
    }
    
    private func removeBackButton() {
        navigationItem.leftBarButtonItem = UIBarButtonItem()
    }
    
    // MARK: - Selectors
    
    @objc private func popToPrevious() {
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Public
    
    func popVC() {
        _ = navigationController?.popViewController(animated: true)
    }
    
    func popToRoot() {
        _ = navigationController?.popToRootViewController(animated: true)
    }
}
