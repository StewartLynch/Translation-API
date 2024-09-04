
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

struct ScanAndTranslateView: View {
    @State private var scannedText = ""
    @FocusState var focusState: Bool
    var body: some View {
        NavigationStack{
            VStack {
                TextField("Scanned Text Here", text: $scannedText, axis: .vertical)
                    .textFieldStyle(.roundedBorder)
                    .focused($focusState)
                Text("Translated Text Here")
                    .italic()
                // This needds to be conditional on camera availability
                Button("Scan with Camera") {
                    focusState = false
                }
                .buttonStyle(.borderedProminent)
                // This will be conditional if supports live VisionKit
                // PhotoPicker here
                
                Spacer()
            }
            .padding()
            .navigationTitle("Scan and translate")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button {
                        focusState = false
                    } label: {
                        Image(systemName: "keyboard.chevron.compact.down.fill")
                    }
                }
            }
        }
    }
}

#Preview {
    ScanAndTranslateView()
}
