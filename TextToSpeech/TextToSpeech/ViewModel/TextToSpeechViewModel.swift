//
//  TextToSpeechViewModel.swift
//  TextToSpeech
//
//  Created by Sukhaman Singh on 10/16/24.
//

import AVFoundation
import SwiftUI

class TextToSpeechViewModel: ObservableObject {
    @Published var sentence: String = ""   // Holds the sentence
    @Published var selectedLanguage: String = "en-US"  // Default language
    private var speechSynthesizer = AVSpeechSynthesizer()  // Speech synthesizer
    // Define word categories
       let subjects = ["I", "You", "We", "The dog", "My friend"]
       let verbs = ["need", "like", "want", "have", "go"]
       let objects = ["water", "a book", "help", "food", "a car"]
       let modifiers = ["quickly", "soon", "now", "tomorrow", "today"]
    // Define available languages
        let languages = [
            ("English", "en-US"),
            ("Spanish", "es-ES"),
            ("French", "fr-FR"),
            // Add more languages as needed
        ]
    private let synthesizer = AVSpeechSynthesizer()
    // Add word to sentence
    func addWord(_ word: String) {
        if sentence.isEmpty {
            sentence = word
        } else {
            sentence += " " + word
        }
    }
    
    // Speak the sentence using AVSpeechSynthesizer
    func speakSentence() {
        if sentence.isEmpty { return }
        let utterance = AVSpeechUtterance(string: sentence)
        utterance.voice = AVSpeechSynthesisVoice(language: selectedLanguage)
        utterance.rate = 0.8
        utterance.prefersAssistiveTechnologySettings = true
        synthesizer.usesApplicationAudioSession = false
        synthesizer.speak(utterance)
       
    }
    
    // Predict the next word
    func predictNextWord(currentSentence: String) -> [String] {
        if currentSentence.contains("I") {
            return ["want", "need", "like"]
        } else if currentSentence.contains("The dog") {
            return ["runs", "barks", "jumps"]
        }
        return []
    }
    
    // Clear the sentence
    func clearSentence() {
        sentence = ""
    }
}
