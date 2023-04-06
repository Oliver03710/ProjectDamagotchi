//
//  UserDefaultsHelper.swift
//  ProjectDamagotchi
//
//  Created by Junhee Yoon on 2022/08/01.
//
import Foundation

class UserdefaultsHelper {
    
    private init() { }
    
    static let standard = UserdefaultsHelper()
    
    let userDefaults = UserDefaults.standard
    
    enum Key: String {
        case food, water, character, intro, name
    }
    
    var food: Int {
        get {
            return userDefaults.integer(forKey: Key.food.rawValue)
        }
        set {
            userDefaults.set(newValue, forKey: Key.food.rawValue)
        }
    }
    
    var water: Int {
        get {
            return userDefaults.integer(forKey: Key.water.rawValue)
        }
        set {
            userDefaults.set(newValue, forKey: Key.water.rawValue)
        }
    }
    
    var character: Any {
        get {
            return userDefaults.object(forKey: Key.character.rawValue) as Any
        }
        set {
            userDefaults.set(newValue, forKey: Key.character.rawValue)
        }
    }
    
    var intro: Bool {
        get {
            return userDefaults.bool(forKey: Key.intro.rawValue)
        }
        set {
            userDefaults.set(newValue, forKey: Key.intro.rawValue)
        }
    }
    
    var name: String {
        get {
            return userDefaults.string(forKey: Key.name.rawValue) ?? "대장"
        }
        set {
            userDefaults.set(newValue, forKey: Key.name.rawValue)
        }
    }
        
    func reset() {
        if let appDomain = Bundle.main.bundleIdentifier {
            userDefaults.removePersistentDomain(forName: appDomain)
        }
    }
    
}
