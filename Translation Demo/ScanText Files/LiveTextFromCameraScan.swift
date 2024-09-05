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

struct LiveTextFromCameraScan: View {
    @Environment(\.dismiss) var dismiss
    @Binding var liveScan: Bool
    @Binding var scannedText: String
    var triggerTranslation: (() -> Void)? = nil
    var body: some View {
        NavigationStack {
            VStack {
                DataScannerVC(
                    scannedText: $scannedText,
                    liveScan: $liveScan,
                    triggerTranslation: triggerTranslation
                )
                Text("Capture Text")
                Button("Cancel") {
                    dismiss()
                }
                .buttonStyle(.borderedProminent)
            }
            .padding()
            .navigationTitle("Capture Text")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    @Previewable @State var liveScan = false
    @Previewable @State var scannedText = ""
    LiveTextFromCameraScan(liveScan: $liveScan, scannedText: $scannedText)
}
