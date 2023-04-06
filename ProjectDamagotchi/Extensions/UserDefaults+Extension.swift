//
//  UserDefaults+Extension.swift
//  ProjectDamagotchi
//
//  Created by Junhee Yoon on 2022/07/30.
//

import Foundation

extension UserDefaults {

    enum Keys: String, CaseIterable {
        case characters
        case food
        case water
        case intro
        case newName

    }

    func reset() {
        Keys.allCases.forEach { removeObject(forKey: $0.rawValue) }
    }

}
