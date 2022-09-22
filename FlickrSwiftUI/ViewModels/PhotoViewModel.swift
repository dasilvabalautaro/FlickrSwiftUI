//
//  PhotoViewModel.swift
//  FlickrSwiftUI
//
//  Created by Arturo Silva Baldellon on 9/17/22.
//

import UIKit

struct PhotoViewModel: Identifiable {
    var photo: Photo
    
    var id: String {
        photo.id
    }
    var owner: String {
        photo.owner
    }
    var secret: String {
        photo.secret
    }
    var server: String {
        photo.server
    }
    var farm: Int {
        photo.farm
    }
    var title: String {
        photo.title
    }
    var ispublic: Int {
        photo.ispublic
    }
    var isfriend: Int {
        photo.isfriend
    }
    var isfamily: Int {
        photo.isfamily
    }
    
    var thumbnailUrl: String {
        return "https://farm\(farm).staticflickr.com/\(server)/\(id)_\(secret)_t.jpg"
    }
    
    var largeUrl: String {
        return "https://farm\(farm).staticflickr.com/\(server)/\(id)_\(secret)_b.jpg"
    }
}

