//
//  UIButton+Extension.swift
//  ProjectDamagotchi
//
//  Created by Junhee Yoon on 2022/07/30.
//

import UIKit

extension UIButton {
    
    func setMainButtons(title: String, image: String) {
        
        self.setTitle(title, for: .normal)
        self.setImage(UIImage(systemName: image), for: .normal)
        self.clipsToBounds = true
        self.layer.cornerRadius = 8
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.fontAndBorderColor().cgColor
        self.titleLabel?.font = .systemFont(ofSize: 14)
        self.tintColor = .fontAndBorderColor()
        self.setTitleColor(.fontAndBorderColor(), for: .normal)
        
    }
    
    func setDetailButtons(color: UIColor) {
        
        self.backgroundColor = color
        self.titleLabel?.font = .systemFont(ofSize: 15)
        self.setTitleColor(UIColor.fontAndBorderColor(), for: .normal)
    }
    
}
