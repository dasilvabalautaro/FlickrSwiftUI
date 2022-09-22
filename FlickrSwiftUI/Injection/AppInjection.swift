//
//  AppInjection.swift
//  FlickrSwiftUI
//
//  Created by Arturo Silva Baldellon on 9/17/22.
//

import Foundation
import Resolver

extension Resolver: ResolverRegistering {
    public static func registerAllServices() {
        register { URLSession(configuration: .default)}
        register { NetworkService() }.implements(NetworkServiceProtocol.self)
        register { URLComponentsService() }
        register { CapturePhotoService() }
        //register { _, args in PhotoViewModel(photo: args())}
        register { LoadCaptureViewModel()}
        register { ImageLoaderService() }
    }
}
