//
//  URLComponentsService.swift
//  FlickrSwiftUI
//
//  Created by Arturo Silva Baldellon on 9/17/22.
//

import Foundation

struct URLComponentsService {
    private let flickrKey: String = "675894853ae8ec6c242fa4c077bcf4a0"
    
    func flickrComponents(query: String) -> URLComponents {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.flickr.com"
        components.path = "/services/rest"
        components.queryItems = [
            URLQueryItem(name: "method", value: "flickr.photos.search"),
            URLQueryItem(name: "api_key", value: self.flickrKey),
            URLQueryItem(name: "text", value: query),
            URLQueryItem(name: "format", value: "json"),
            URLQueryItem(name: "nojsoncallback", value: "1"),
            URLQueryItem(name: "page", value: "1")
        ]
        return components
    }
}
