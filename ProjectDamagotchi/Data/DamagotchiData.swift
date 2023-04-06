//
//  DamagotchiData.swift
//  ProjectDamagotchi
//
//  Created by Junhee Yoon on 2022/07/23.
//

import UIKit

struct Damagotchi: Codable {
    var name: String
    var characterClass: Int
    
    enum Name: String, CaseIterable {
        case cactus = "따끔따끔 다마고치"
        case sunny = "방실방실 다마고치"
        case star = "반짝반짝 다마고치"
        
        var damagotchiClass: Int {
            switch self {
            case .cactus: return 1
            case .sunny: return 2
            case .star: return 3
            }
        }
        
        var introduction: String {
            switch self {
            case .cactus: return "저는 따끔따끔 다마고치입니당. 몸에 독을 품고 있으니 함부로 건들면 다쳐요!"
            case .sunny: return "저는 방실방실 다마고치입니당. 아주아주 뜨거운 아이에요! 체온은 10,000ºC까지 올라가요!"
            case .star: return "저는 반짝반짝 다마고치입니당. 너무 빛나서 저를 직접 보면 실명해요!"
            }
        }
    }
    
    func leveling() -> Int {
        
        let level = Int(Float(UserdefaultsHelper.standard.food / 5) + Float(UserdefaultsHelper.standard.water / 2))
        
        switch level {
        case 1..<10: return level
        case 10...: return 9
        default: return 1
        }
    }
    
    func inputImages(character: Int) -> String {
        
        switch character {
        case 0...Name.allCases.count: return "\(Name.allCases[character - 1].damagotchiClass)-\(leveling())"
        default: return "NoImage"
        }
        
    }
    
    func basicImages(character: Int) -> String {
        return "\(character)-5"
    }
    
    func characterIntroduction(_ name: String) -> String {
        
        switch name {
        case Damagotchi.Name.cactus.rawValue: return "저는 따끔따끔 다마고치입니당. 몸에 독을 품고 있으니 함부로 건들면 다쳐요!"
        case Damagotchi.Name.sunny.rawValue: return "저는 방실방실 다마고치입니당. 아주아주 뜨거운 아이에요! 체온은 10,000ºC까지 올라가요!"
        case Damagotchi.Name.star.rawValue: return "저는 반짝반짝 다마고치입니당. 너무 빛나서 저를 직접 보면 실명해요!"
        default: return ""
        }
    }
    
}

struct DamagotchiData {
    let DamagotchiInstances: [Damagotchi] =
    [Damagotchi(name: Damagotchi.Name.cactus.rawValue, characterClass: Damagotchi.Name.cactus.damagotchiClass),
     Damagotchi(name: Damagotchi.Name.sunny.rawValue, characterClass: Damagotchi.Name.sunny.damagotchiClass),
     Damagotchi(name: Damagotchi.Name.star.rawValue, characterClass: Damagotchi.Name.star.damagotchiClass)]
}

//class DamagotchiClass {
//
//    private init() { }
//
//    static let character = DamagotchiClass()
//
//    enum Name: String, CaseIterable {
//        case cactus = "따끔따끔 다마고치"
//        case sunny = "방실방실 다마고치"
//        case star = "반짝반짝 다마고치"
//    }
//
//    enum Image: Int, CaseIterable {
//        case cactus = 1
//        case sunny
//        case star
//
//        var images: String {
//            switch self {
//            case .cactus: return "\(DamagotchiClass.Image.cactus.rawValue)-\(DamagotchiClass.character.leveling())"
//            case .sunny: return "\(DamagotchiClass.Image.sunny.rawValue)-\(DamagotchiClass.character.leveling())"
//            case .star: return "\(DamagotchiClass.Image.star.rawValue)-\(DamagotchiClass.character.leveling())"
//            }
//        }
//    }
//
//    func leveling() -> Int {
//
//        let level = Int(Float(UserdefaultsHelper.standard.food / 5) + Float(UserdefaultsHelper.standard.water / 2))
//
//        switch level {
//        case 1..<10: return level
//        case 10...: return 9
//        default: return 1
//        }
//    }
//
//}


enum Lines: String, CaseIterable {
    case general
    case food
    case water
    
    var smallTalks: [String] {
        switch self {
        case .general:
            return ["만나서 반갑습니다!!",
                    "오늘 날씨가 너무 좋네요!",
                    "오늘 하루는 어떠셨나요?",
                    "\(UserdefaultsHelper.standard.name)님 안녕하세요?"]
        case .food:
            return ["이제 밥 그만 주세요",
                    "우왕 마싰다~!!",
                    "배가 찼어요!",
                    "냠냠 쩝쩝,,",
                    "목이 말라요...",
                    "물이나 줘요"]
        case .water:
            return ["이제 목이 안 말라요",
                    "물배가 찼어요!",
                    "크으~ 시원하다~~!",
                    "꿀꺽꿀꺽.. 캬~~!",
                    "물은 그만!",
                    "밥이나 주세요"]
        }
    }
}


