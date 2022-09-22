//
//  LoadCaptureViewModel.swift
//  FlickrSwiftUI
//
//  Created by Arturo Silva Baldellon on 9/17/22.
//

import Foundation
import Resolver

class LoadCaptureViewModel: ObservableObject, Identifiable {
    @Published private(set) var state: LoadState = .idle
    @Injected private var capturePhotoService: CapturePhotoService
}

extension LoadCaptureViewModel {
    func fetchCapture(query: String) {
        state = .loading
        capturePhotoService.fetchCapture(query: query){
            [weak self] dataCloud, error in
            guard let self = self else {return}
            if let dataCloud = dataCloud {
                self.state = .loaded(dataCloud.photos.photo)
            }else if let error = error {
                self.state = .failed(error)
            }
        }
    }
}
