//
//----------------------------------------------
// Original project: Translation Demo
// by  Stewart Lynch on 2024-09-04
//
// Follow me on Mastodon: @StewartLynch@iosdev.space
// Follow me on Threads: @StewartLynch (https://www.threads.net)
// Follow me on X: https://x.com/StewartLynch
// Follow me on LinkedIn: https://linkedin.com/in/StewartLynch
// Subscribe on YouTube: https://youTube.com/@StewartLynch
// Buy me a ko-fi:  https://ko-fi.com/StewartLynch
//----------------------------------------------
// Copyright © 2024 CreaTECH Solutions. All rights reserved.


import Foundation
import Translation

@Observable
class TranslationService {
    var translatedText = ""
    var availableLanguages: [AvailableLanguage] = []
    
    init() {
        getSupportedLanguages()
    }
    
    func getSupportedLanguages() {
        Task { @MainActor in
            let supportedLanguages = await LanguageAvailability().supportedLanguages
            availableLanguages = supportedLanguages.map { locale in
                AvailableLanguage(locale: locale)
            }
            .sorted()
        }
    }
    
    func translate(text: String, using session: TranslationSession) async throws {
        let response = try await session.translate(text)
        translatedText = response.targetText
    }
}
