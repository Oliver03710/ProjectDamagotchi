//
//  UILabel+Extension.swift
//  ProjectDamagotchi
//
//  Created by Junhee Yoon on 2022/08/02.
//

import UIKit

extension UILabel {
    
    func setLabels(name: String, fontSize: CGFloat) {
        
        self.text = name
        self.layer.borderColor = UIColor.fontAndBorderColor().cgColor
        self.layer.borderWidth = 1
        self.clipsToBounds = true
        self.layer.cornerRadius = 4
        self.font = .boldSystemFont(ofSize: fontSize)
        self.textColor = .fontAndBorderColor()
        self.textAlignment = .center
        self.numberOfLines = 0
        
    }
    
    func setLabels(fontSize: CGFloat) {
        
        self.layer.borderColor = UIColor.fontAndBorderColor().cgColor
        self.font = .systemFont(ofSize: fontSize)
        self.textColor = .fontAndBorderColor()
        self.textAlignment = .center
        self.numberOfLines = 0
        
    }
    
}
