//
//  Environment.swift
//  ListView
//
//  Created by Sukhaman Singh on 10/15/24.
//

import Foundation

class Environment {
    static let shared = Environment()
    private var envDict: [String: String] = [:]

    private init() {
        loadEnvFile()
    }

    private func loadEnvFile() {
        // Locate the .env file in the app's bundle or project directory
        if let envFilePath = Bundle.main.url(forResource: ".env", withExtension: nil)?.path {
            do {
                // Read the contents of the .env file
                let envContent = try String(contentsOfFile: envFilePath)
                // Split the contents into lines
                let lines = envContent.split { $0.isNewline }
                for line in lines {
                    // Split each line by "=" to get key-value pairs
                    let keyValue = line.split(separator: "=", maxSplits: 1).map { String($0) }
                    if keyValue.count == 2 {
                        // Store the key-value pair in the dictionary
                        envDict[keyValue[0]] = keyValue[1]
                    }
                }
            } catch {
                print("Error reading .env file: \(error)")
            }
        } else {
            print(".env file not found")
        }
    }

    // Function to get the value of an environment variable by key
    func get(_ key: String) -> String? {
        return envDict[key]
    }
}
