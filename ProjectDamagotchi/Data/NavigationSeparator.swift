//
//  NavigationSeparator.swift
//  ProjectDamagotchi
//
//  Created by Junhee Yoon on 2022/08/01.
//

import UIKit

class NavigationSeparator: UINavigationBarAppearance {
    
    private init() { }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    static let barAppearance = NavigationSeparator()
    
    func setSeparator() {
        NavigationSeparator.barAppearance.backgroundColor = .backgroundColor()
        UINavigationController?.navigationItem.scrollEdgeAppearance = NavigationSeparator.barAppearance
    }
    
}
