//
//  Navigation+Ext.swift
//  FitnessAppMidtermProject
//
//  Created by Sevar Jafarli on 23.04.24.
//

import UIKit


extension UINavigationController {
    func removeAllViewControllersAndPush(to viewController: UIViewController, animated: Bool = true) {
        // Remove current and below view controllers
        var viewControllers = self.viewControllers
        if let index = viewControllers.firstIndex(of: self.visibleViewController!) {
            viewControllers.removeSubrange(0...index)
        }
        
        // Push to the new view controller
        viewControllers.append(viewController)
        self.setViewControllers(viewControllers, animated: animated)
    }
}
