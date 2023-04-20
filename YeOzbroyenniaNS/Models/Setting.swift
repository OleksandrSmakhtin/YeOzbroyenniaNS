//
//  Setting.swift
//  YeOzbroyenniaNS
//
//  Created by Oleksandr Smakhtin on 20.04.2023.
//

import Foundation

enum SettingType {
    case changeTheme
    case favorite
    case rate
    case thank
}

struct Setting {
    let type: SettingType
    let image: String
    let title: String
}

class SettingsData {
    static let shared = SettingsData()
    
    func getSettings() -> [Setting] {
        let settings = [
            Setting(type: .changeTheme, image: "lightbulb", title: "Темний режим"),
            Setting(type: .favorite, image: "heart", title: "Обране"),
            Setting(type: .rate, image: "hand.thumbsup", title: "Оцінити додаток"),
            Setting(type: .thank, image: "hryvniasign", title: "Підтримати автора")
        ]
        
        return settings
    }
}
