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

struct MultipleTranslationsView: View {
    var body: some View {
        NavigationStack {
            List(Review.samples) { review in
                VStack {
                    Text(review.comment)
                    if !review.translatedComment.isEmpty {
                        Text(review.translatedComment).italic().foregroundStyle(.secondary)
                    }
                }
            }
            .navigationTitle("Multiple translations")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Reset") {
                        
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        
                    } label: {
                        Image(systemName: "translate")
                    }
                }
            }
        }
    }
}

#Preview {
    MultipleTranslationsView()
}
