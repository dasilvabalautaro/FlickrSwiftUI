//
//  LoadState.swift
//  FlickrSwiftUI
//
//  Created by Arturo Silva Baldellon on 9/17/22.
//

enum LoadState: Equatable {
    case idle
    case loading
    case failed(AppError)
    case loaded([Photo])
}
