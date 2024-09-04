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
import AVFoundation

struct FlexibleTranslationView: View {
    @Environment(TranslationService.self) var translationService
    @State private var textToTranslate = ""
    @FocusState private var focusState: Bool
    @State private var targetLanguage = Locale.Language(
        languageCode: "en",
        script: nil,
        region: "US"
    )
    @State private var configuration: TranslationSession.Configuration?
    var body: some View {
        NavigationStack {
            Form {
                TextField("Text to translate", text: $textToTranslate, axis: .vertical)
                    .focused($focusState)
                    .textFieldStyle(.roundedBorder)
                Text(translationService.translatedText)
                    .italic()
                    .textSelection(.enabled)
                    .translationTask(configuration) { session in
                        do {
                            try await translationService.translate(
                                text: textToTranslate,
                                using: session
                            )
                        } catch {
                            translationService.translatedText = ""
                            print(error.localizedDescription)
                        }
                    }
                Picker("Target Language", selection: $targetLanguage) {
                    ForEach(translationService.availableLanguages) { language in
                        Text(language.localizedName())
                            .tag(language.locale)
                    }
                }
                .onChange(of: targetLanguage) { oldValue, newValue in
                    if newValue != oldValue {
                        configuration?.invalidate()
                        configuration = TranslationSession.Configuration(target: targetLanguage)
                    }
                }
                HStack {
                    Button("Translate", systemImage: "translate") {
                        triggerTranslation()
                        focusState = false
                    }
                    .buttonStyle(.borderedProminent)
                    .foregroundStyle(.white)
                    .disabled(textToTranslate.isEmpty)
                    Spacer()
                    Button {
                        let utterance = AVSpeechUtterance(string: translationService.translatedText)
                        utterance.voice = AVSpeechSynthesisVoice(
                            language: targetLanguage.languageCode?.debugDescription
                        )
                        AVSpeechSynthesizer().speak(utterance)
                    } label: {
                        Image(systemName: "speaker.wave.2.bubble")
                    }
                    .disabled(translationService.translatedText.isEmpty)
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
            .navigationTitle("Flexible Translation")
        }
    }
    func triggerTranslation() {
        print("Trigger translation")
        if configuration == nil {
            configuration = TranslationSession.Configuration(target: targetLanguage)
        } else {
            configuration?.invalidate()
        }
    }
}

#Preview {
    FlexibleTranslationView()
        .environment(TranslationService())
}

