//
//  UITextField+Extension.swift
//  ProjectDamagotchi
//
//  Created by Junhee Yoon on 2022/07/30.
//

import UIKit

extension UITextField {
    func setTextFields(placeholder: String) {
        self.placeholder = placeholder
        self.textAlignment = .center
        self.borderStyle = .none
        self.keyboardType = .decimalPad
    }
}
