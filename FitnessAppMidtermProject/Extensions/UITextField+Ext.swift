//
//  UITextField+Ext.swift
//  FitnessAppMidtermProject
//
//  Created by Sevar Jafarli on 23.04.24.
//


import UIKit.UITextField

extension UITextField {
    func validatedText(validationType: ValidatorType) throws -> String {
        let validator = ValidatorFactory.validatorFor(type: validationType)
        return try validator.validated(self.text!)
    }
}
