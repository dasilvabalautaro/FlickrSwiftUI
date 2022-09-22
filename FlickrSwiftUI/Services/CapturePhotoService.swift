//
//  CapturePhotoService.swift
//  FlickrSwiftUI
//
//  Created by Arturo Silva Baldellon on 9/17/22.
//

import Foundation
import Resolver

class CapturePhotoService {
    @Injected private var networkService: NetworkServiceProtocol
    @Injected private var urlComponentsService: URLComponentsService
}

extension CapturePhotoService {
    func fetchCapture(query: String,
                      completion: @escaping (DataCloud?, AppError?) -> Void) {
        guard let url = urlComponentsService
                .flickrComponents(query: query).url else {
            return completion(nil, AppError.badURL(description: "The url is not valid. Please try again later."))
        }
        
        networkService.fetch(with: URLRequest(url: url)) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let data):
                    guard let dataCloud = try? data.decoded() as DataCloud else {
                        completion(nil, AppError.parsing(description: "Parsing data failed, please try again later."))
                        return
                    }
                    return completion(dataCloud, nil)
                case .failure(let error): return completion(nil, error)
                }
            }
        }
    }
}
