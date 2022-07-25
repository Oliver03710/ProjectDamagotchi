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
    var level: [Int]
}

struct DamagotchiData {
    let damas: [Damagotchi] = [Damagotchi(name: "따끔따끔 다마고치", characterClass: 1, level: [1, 2, 3, 4, 5, 6, 7, 8, 9]),
                               Damagotchi(name: "방실방실 다마고치", characterClass: 2, level: [1, 2, 3, 4, 5, 6, 7, 8, 9]),
                               Damagotchi(name: "반짝반짝 다마고치", characterClass: 3, level: [1, 2, 3, 4, 5, 6, 7, 8, 9])]
}

struct Talks {
    let lines = ["만나서 반갑습니다!!",
                 "오늘 날씨가 너무 좋네요!",
                 "오늘 하루는 어떠셨나요?",
                 "\(UserDefaults.standard.string(forKey: "Naming") ?? "대장")님 안녕하세요?"]
    
    let food = ["이제 밥 그만 주세요",
                "우왕 마싰다~!!",
                "배가 찼어요!",
                "냠냠 쩝쩝,,",
                "목이 말라요...",
                "물이나 줘요"]
    
    let water = ["이제 목이 안 말라요",
                 "물배가 찼어요!",
                 "크으~ 시원하다~~!",
                 "꿀꺽꿀꺽.. 캬~~!",
                 "물은 그만!",
                 "밥이나 주세요"]
}
