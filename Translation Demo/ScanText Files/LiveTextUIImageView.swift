//
//----------------------------------------------
// Original project: Translation Demo
// by  Stewart Lynch on 2024-09-01
//
// Follow me on Mastodon: @StewartLynch@iosdev.space
// Follow me on Threads: @StewartLynch (https://www.threads.net)
// Follow me on X: https://x.com/StewartLynch
// Follow me on LinkedIn: https://linkedin.com/in/StewartLynch
// Subscribe on YouTube: https://youTube.com/@StewartLynch
// Buy me a ko-fi:  https://ko-fi.com/StewartLynch
//----------------------------------------------
// Copyright © 2024 CreaTECH Solutions. All rights reserved.

import SwiftUI
import VisionKit

@MainActor
struct LiveTextUIImageView: UIViewRepresentable {
    var image: UIImage
    let analyzer = ImageAnalyzer()
    let interaction = ImageAnalysisInteraction()
    let imageView = ResizableImageView()
    func makeUIView(context: Context) -> UIImageView {
        imageView.image = image
        imageView.addInteraction(interaction)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }
    
    func updateUIView(_ uiView: UIImageView, context: Context) {
        Task {
            do {
                let configuration = ImageAnalyzer.Configuration([.text])
                if let image = imageView.image {
                    let analysis = try await analyzer.analyze(image, configuration: configuration)
                    interaction.analysis = analysis
                    interaction.preferredInteractionTypes = .textSelection
                }
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    
}

class ResizableImageView: UIImageView {
    override var intrinsicContentSize: CGSize {
        .zero
    }
}
