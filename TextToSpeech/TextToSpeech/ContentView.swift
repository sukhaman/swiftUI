//
//  ContentView.swift
//  TextToSpeech
//
//  Created by Sukhaman Singh on 10/16/24.
//

import SwiftUI


struct ContentView: View {
    @StateObject private var viewModel = TextToSpeechViewModel()
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack {
                    Text("Build a sentence")
                        .font(.headline)
                        .padding()
                    
                    // Language Picker
                    Picker("Select Language", selection: $viewModel.selectedLanguage) {
                        ForEach(viewModel.languages, id: \.1) { (languageName, languageCode) in
                            Text(languageName).tag(languageCode)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .padding()
                    
                    // Adaptive layout for categories
                    if geometry.size.width > 600 {
                        // Horizontal layout for larger screens
                        HStack {
                            categoryView(category: "Subjects", words: viewModel.subjects, color: Color.blue, viewModel: viewModel)
                            categoryView(category: "Verbs", words: viewModel.verbs, color: Color.green, viewModel: viewModel)
                            categoryView(category: "Objects", words: viewModel.objects, color: Color.red, viewModel: viewModel)
                            categoryView(category: "Modifiers", words: viewModel.modifiers, color: Color.orange, viewModel: viewModel)
                        }
                    } else {
                        // Vertical layout for smaller screens
                        VStack {
                            categoryView(category: "Subjects", words: viewModel.subjects, color: Color.blue, viewModel: viewModel)
                            categoryView(category: "Verbs", words: viewModel.verbs, color: Color.green, viewModel: viewModel)
                            categoryView(category: "Objects", words: viewModel.objects, color: Color.red, viewModel: viewModel)
                            categoryView(category: "Modifiers", words: viewModel.modifiers, color: Color.orange, viewModel: viewModel)
                        }
                    }
                    
                    Spacer()
                    
                    // Display Sentence
                    Text("\(L10n.sentence): \(viewModel.sentence)")
                        .font(.title3)
                        .padding()
                        .multilineTextAlignment(.center)
                    
                    // Speak button
                    Button(action: {
                        viewModel.speakSentence()
                    }) {
                        Text("\(L10n.speak)")
                            .padding()
                            .frame(maxWidth: geometry.size.width * 0.8)  // Responsive width
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .padding(.bottom, 10)
                    
                    // Clear button
                    Button(action: {
                        viewModel.clearSentence()
                    }) {
                        Text(L10n.clear)
                            .padding()
                            .frame(maxWidth: geometry.size.width * 0.8)
                            .background(Color.red)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .padding(.bottom, 20)
                }
                .padding()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            } // Expand to fit available space
        }
    }
    
    // Reusable view for each word category
    @ViewBuilder
    func categoryView(category: String, words: [String], color: Color, viewModel: TextToSpeechViewModel) -> some View {
        VStack {
            Text(category)
                .font(.headline)
                .padding(.bottom, 5)
            
            // Adaptive button layout
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))], spacing: 10) {
                ForEach(words, id: \.self) { word in
                    Button(action: {
                        viewModel.addWord(word)
                    }) {
                        Text(word)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(color)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                }
            }
        }
        .padding()
    }
}




#Preview {
    ContentView()
}