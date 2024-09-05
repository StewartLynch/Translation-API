//
//----------------------------------------------
// Original project: Translation Demo
// by  Stewart Lynch on 2024-09-02
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

struct MultipleTranslationsView: View {
    @Environment(TranslationService.self) private var translationService
    @State private var configuration: TranslationSession.Configuration?
    var body: some View {
        NavigationStack {
            List(translationService.reviews) { review in
                VStack {
                    Text(review.comment)
                    if !review.translatedComment.isEmpty {
                        Text(review.translatedComment).italic().foregroundStyle(.secondary)
                    }
                }
            }
            .translationTask(configuration) { session in
                do {
//                    try await translationService.translateAllAtOnce(using: session)
                    try await translationService.translateSequence(using: session)
                } catch {
                    print(error.localizedDescription)
                }
            }
            .navigationTitle("Multiple translations")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Reset") {
                        translationService.removeTranslations()
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        triggerTranslation()
                    } label: {
                        Image(systemName: "translate")
                    }
                }
            }
        }
    }
    
    func triggerTranslation() {
        if configuration == nil {
            configuration = .init(target: .init(identifier: "en"))
        } else {
            configuration?.invalidate()
        }
    }
}

#Preview {
    MultipleTranslationsView()
        .environment(TranslationService())
}
