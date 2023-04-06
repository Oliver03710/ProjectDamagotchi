//
//  Identifier+Protocol.swift
//  ProjectDamagotchi
//
//  Created by Junhee Yoon on 2022/08/01.
//

import UIKit

protocol IdentifierViewProtocol {
    static var identifier: String { get }
}

extension UIViewController: IdentifierViewProtocol {
   
    static var identifier: String {
            return String(describing: self)
    }
    
}

extension UITableViewCell: IdentifierViewProtocol {
   
    static var identifier: String {
            return String(describing: self)
    }
    
}

extension UICollectionViewCell: IdentifierViewProtocol {
   
    static var identifier: String {
            return String(describing: self)
    }
    
}
