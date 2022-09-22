//
//  PhotoListView.swift
//  FlickrSwiftUI
//
//  Created by Arturo Silva Baldellon on 9/17/22.
//

import SwiftUI
import Resolver

struct PhotoListView: View {
    @ObservedObject var loadCaptureViewModel: LoadCaptureViewModel = Resolver.resolve()
    
    @State private var query = "Albert"
    
    var body: some View {
        switch loadCaptureViewModel.state {
        case .idle: Color.appBackground.onAppear {
            loadCaptureViewModel.fetchCapture(query: query)
        }
        case .loading: ProgressView("Loading Photos...")
        case .failed(let error): ErrorView(errorMessage: error.description)
        case .loaded(let photos):
            NavigationView {
                VStack {
                    Divider().background(Color.black)
                    ScrollView(.vertical) {
                        LazyVStack(alignment: .leading, spacing: 5.0) {
                            ForEach(photos) {photo in
                                let photoViewModel = PhotoViewModel(photo: photo)
                                NavigationLink(
                                    destination: PhotoDetailView(photoViewModel: photoViewModel)){
                                    PhotoView(photoViewModel: photoViewModel)
                                }
                            }
                        }
                    }
                }
                
                .toolbar {
                    ToolbarItem(placement: .principal){
                        HStack {
                            Image(systemName: "person")
                                .foregroundColor(.secondary)
                            TextField("Search name", text: $query, onCommit: {
                                loadCaptureViewModel.fetchCapture(query: query)
                            })
                            Image(systemName: "eye")
                                .foregroundColor(.secondary)
                        }
                        .padding(8)
                        .background(Capsule().fill(Color.gray.opacity(0.3)))
                    }
                    
                }
            }
        }
    }
}
