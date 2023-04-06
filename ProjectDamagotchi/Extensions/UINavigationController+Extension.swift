//
//  UINavigationController+Extension.swift
//  ProjectDamagotchi
//
//  Created by Junhee Yoon on 2022/07/31.
//

import UIKit

extension UINavigationController {
    
    func setNavigationBar() {
       
        navigationItem.title = "\(UserdefaultsHelper.standard.name) 이름 정하기"
        self.navigationController?.navigationBar.tintColor = UIColor.fontAndBorderColor()
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.fontAndBorderColor()]
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "저장", style: .plain, target: self, action: #selector(saveName))
        
    }
    
    @objc func saveName(textField: UITextField) {
        
        guard let text = textField.text else { return }
        UserdefaultsHelper.standard.name = text
        self.navigationController?.popViewController(animated: true)
        
    }
}
