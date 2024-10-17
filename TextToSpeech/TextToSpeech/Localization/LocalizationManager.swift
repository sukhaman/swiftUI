//
//  LocalizationManager.swift
//  TextToSpeech
//
//  Created by Sukhaman Singh on 10/16/24.
//

import Foundation

class LocalizationManager {
    static var currentLanguage: String {
        get {
            if let languageCode = UserDefaults.standard.array(forKey: "AppleLanguages") as? [String] {
                var langauge = languageCode.first ?? "en"
                if langauge.contains("en-US") {
                     langauge = "en"
                 }
                return langauge
            } else {
                return "en"
            }

        }
        set {
            UserDefaults.standard.set([newValue], forKey: "AppleLanguages")
            UserDefaults.standard.synchronize()
        }
    }

    static func setLanguage(_ language: String) {
        currentLanguage = language
        UserDefaults.standard.set([language], forKey: "AppleLanguages")
        NotificationCenter.default.post(name: .languageChanged, object: nil)
    }
    
    static func resetLanguage() {
        Bundle.resetLanguage()
    }
    
}

extension Bundle {
    static func setLanguage(_ language: String) {
        // Use swizzling or other mechanisms to set the desired language for testing
        UserDefaults.standard.set([language], forKey: "AppleLanguages")
    }

    static func resetLanguage() {
        // Reset the language to the default after testing
        UserDefaults.standard.removeObject(forKey: "AppleLanguages")
    }
}

extension Notification.Name {
    static let languageChanged = Notification.Name("languageChanged")
}
