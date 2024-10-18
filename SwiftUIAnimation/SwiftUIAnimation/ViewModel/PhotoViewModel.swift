//
//  PhotoViewModel.swift
//  SwiftUIAnimation
//
//  Created by Sukhaman Singh on 10/17/24.
//

import Foundation

class PhotoViewModel: ObservableObject {
    
    @Published var cards: [URL] = []
    
    init() {
        createPhotosURL()
    }
    
    func createPhotosURL() {
        let firstPhoto = URL(string: "https://image.tmdb.org/t/p/w500/yDHYTfA3R0jFYba16jBB1ef8oIt.jpg")
        cards.append(firstPhoto!)
        let secondPhoto = URL(string: "https://image.tmdb.org/t/p/w500/8cdWjvZQUExUUTzyp4t6EDMubfO.jpg")
        cards.append(secondPhoto!)
        let thirdPhoto = URL(string: "https://image.tmdb.org/t/p/w500/kKgQzkUCnQmeTPkyIwHly2t6ZFI.jpg")
        cards.append(thirdPhoto!)
        let fourthPhoto = URL(string: "https://image.tmdb.org/t/p/w500/izuzUb0sDokqp9o8utVfsrSJuy5.jpg")
        cards.append(fourthPhoto!)
        let fifthPhoto = URL(string: "https://image.tmdb.org/t/p/w500/wWba3TaojhK7NdycRhoQpsG0FaH.jpg")
        cards.append(fifthPhoto!)
    }
}
