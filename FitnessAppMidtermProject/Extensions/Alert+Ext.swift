//
//  Alert+Ext.swift
//  FitnessAppMidtermProject
//
//  Created by Sevar Jafarli on 23.04.24.
//

import UIKit

/// show error alert view
extension UIViewController {
    func showErrorAlert(errorMsg: String) {
        let alertVc = UIAlertController(title: "Error", message: errorMsg, preferredStyle: .alert)
        
        let closeAction = UIAlertAction(title: "Close", style: .cancel)
        alertVc.addAction(closeAction)
        present(alertVc, animated: true)
    }
}
