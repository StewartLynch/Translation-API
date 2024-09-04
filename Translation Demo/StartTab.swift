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

struct StartTab: View {
    var body: some View {
        TabView {
            Tab("Basic", systemImage:  "1.circle.fill") {
                BasicTranslationView()
            }
            Tab("Flexible Translation", systemImage: "2.circle.fill") {
                FlexibleTranslationView()
            }
            Tab("Muiltiple Translations", systemImage: "3.circle.fill") {
                MultipleTranslationsView()
            }
            Tab("Scan and Translate", systemImage: "4.circle.fill") {
                ScanAndTranslateView()
            }
        }
    }
}

#Preview {
    StartTab()
}
