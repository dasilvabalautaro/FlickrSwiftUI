//
//  PhotoList.swift
//  FlickrSwiftUI
//
//  Created by Arturo Silva Baldellon on 9/17/22.
//
import Foundation

struct Photos: Codable, Equatable {
    var page: Int
    var pages: Int
    var perpage: Int
    var total: Int
    var photo: [Photo]
}
