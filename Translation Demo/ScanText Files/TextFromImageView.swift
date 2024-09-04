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

struct TextFromImageView: View {
    @Environment(\.dismiss) var dismiss
    private let pastboard = UIPasteboard.general
    let imageToScan: UIImage
    @Binding var scannedText: String
    
    @State private var currentPastboard = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                LiveTextUIImageView(image: imageToScan)
                Text("Select some text and copy it")
                Button("Dismiss") {
                    if let string = pastboard.string {
                        if !string.isEmpty {
                            scannedText = string
                        }
                    }
                    dismiss()
                }
                .buttonStyle(.borderedProminent)
            }
            .navigationTitle("Copy Text")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear {
                pastboard.string = ""
            }
        }
    }
}

#Preview {
    @Previewable @State var scannedText = ""
    TextFromImageView(imageToScan: UIImage(), scannedText: $scannedText)
}
