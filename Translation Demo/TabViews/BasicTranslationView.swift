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
import Translation

struct BasicTranslationView: View {
    @State private var textToTranslate = ""
    @FocusState private var focusState: Bool
    @State private var presentTranslator = false
    @State private var translatedText = ""
    var body: some View {
        NavigationStack {
            Form {
                TextField("Text to translate", text: $textToTranslate, axis: .vertical)
                    .focused($focusState)
                    .textFieldStyle(.roundedBorder)
                Text(translatedText)
                Button("Translate", systemImage: "translate") {
                    presentTranslator.toggle()
                    focusState = false
                }
                .buttonStyle(.borderedProminent)
                .foregroundStyle(.white)
                .disabled(textToTranslate.isEmpty)
//                .translationPresentation(isPresented: $presentTranslator, text: textToTranslate)
                .translationPresentation(
                    isPresented: $presentTranslator,
                    text: textToTranslate) {
                       translatedText = $0
                    }
            }
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
            .navigationTitle("Translator")
        }
    }
    
  
}

#Preview {
    BasicTranslationView()
}
