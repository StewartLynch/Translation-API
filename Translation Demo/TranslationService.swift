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
    var reviews: [Review] = []
    var availableLanguages: [AvailableLanguage] = []
    
    init() {
        getSupportedLanguages()
        reviews = Review.samples
    }
    
    func removeTranslations() {
        reviews.indices.forEach { index in
            reviews[index].translatedComment = ""
        }
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
    
    func translateAllAtOnce(using session: TranslationSession) async throws {
        Task { @MainActor in
            let requests:[TranslationSession.Request] = reviews.map { review in
                    .init(sourceText: review.comment)
            }
            let responses = try await session.translations(from: requests)
            let stringsToTranslate = responses.map { response in
                response.targetText
            }
            for(index, translation) in stringsToTranslate.enumerated() {
                reviews[index].translatedComment = translation
            }
        }
    }
    
    func translateSequence(using session: TranslationSession) async throws {
        Task { @MainActor in
            let requests:[TranslationSession.Request] = reviews.map { review in
                    .init(sourceText: review.comment, clientIdentifier: review.id.uuidString)
            }
            for try await response in session.translate(batch: requests) {
                guard let id = UUID(uuidString: response.clientIdentifier ?? "") else { continue }
                if let index = reviews.firstIndex(where: {$0.id == id}) {
                    reviews[index].translatedComment = response.targetText
                }
            }
        }
    }
}
