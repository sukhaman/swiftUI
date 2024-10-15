//
//  CachedAsyncImage.swift
//  ListView
//
//  Created by Sukhaman Singh on 10/15/24.
//

import SwiftUI

struct CachedAsyncImage: View {
    let url: URL
    let placeholder: Image
    let width: CGFloat
    let height: CGFloat

    @State private var uiImage: UIImage? = nil

    var body: some View {
        ZStack {
            if let image = uiImage {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: width, height: height)
                    .cornerRadius(8)
            } else {
                placeholder
                    .resizable()
                    .frame(width: width, height: height)
                    .cornerRadius(8)
                    .onAppear {
                        Task {
                            await loadImage()
                        }
                    }
            }
        }
    }

    private func loadImage() async {
        if let cachedImage = ImageCache.shared.getImage(for: url) {
            self.uiImage = cachedImage
        } else {
            // Fetch the image from the network
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                if let image = UIImage(data: data) {
                    ImageCache.shared.setImage(image, for: url)
                    await MainActor.run {
                        self.uiImage = image
                    }
                }
            } catch {
                
            }
        }
    }
}
