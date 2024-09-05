
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
import VisionKit
import PhotosUI

struct ScanAndTranslateView: View {
    @Environment(TranslationService.self) private var translationService
    @State private var configuration: TranslationSession.Configuration?
    @State private var scannedText = ""
    @FocusState var focusState: Bool
    @State private var imagePicker = ImagePicker()
    @State private var liveScan = false
    var body: some View {
        NavigationStack{
            VStack {
                TextField("Scanned Text Here", text: $scannedText, axis: .vertical)
                    .textFieldStyle(.roundedBorder)
                    .focused($focusState)
                Text(translationService.translatedText)
                    .italic()
                if DataScannerViewController.isSupported {
                    Button("Scan with Camera") {
                        liveScan.toggle()
                        focusState = false
                    }
                   
                } else {
                    Text("This device does not support Live Text from camera scan")
                }
                if ImageAnalyzer.isSupported {
                    PhotosPicker(selection: $imagePicker.imageSelection) {
                        Text("Select Image")
                    }
                } else {
                    Text("This device does not support Live Text from photo scan")
                }
                Spacer()
            }
            .translationTask(configuration) { session in
                do {
                    try await translationService.translate(text: scannedText, using: session)
                } catch {
                    translationService.translatedText = ""
                    print(error.localizedDescription)
                }
            }
            .buttonStyle(.borderedProminent)
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
            .sheet(item: $imagePicker.imageToScan) { imageToScan in
                TextFromImageView(
                    imageToScan: imageToScan.image,
                    scannedText: $scannedText,
                    triggerTranslation: triggerTranslation
                )
            }
            .sheet(isPresented: $liveScan) {
                LiveTextFromCameraScan(
                    liveScan: $liveScan,
                    scannedText: $scannedText,
                    triggerTranslation: triggerTranslation
                )
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
    ScanAndTranslateView()
        .environment(TranslationService())
}
