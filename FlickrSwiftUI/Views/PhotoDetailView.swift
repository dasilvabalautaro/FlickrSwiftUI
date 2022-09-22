//
//  PhotoDetailView.swift
//  FlickrSwiftUI
//
//  Created by Arturo Silva Baldellon on 9/18/22.
//

import SwiftUI
import Resolver

struct PhotoDetailView: View {
    var photoViewModel: PhotoViewModel
    
    @ObservedObject var imageLoader: ImageLoaderService = Resolver.resolve()
    
    @State var image: UIImage = UIImage()
    @State private var isFamily = false
    @State private var isFriend = false
    
    var body: some View {
        ScrollView {
            VStack {
                Text(String(photoViewModel.title))
                    .font(.custom("Copperplate", size: 33))
                HStack {
                    Spacer()
                    Toggle("IsFamily", isOn: $isFamily).padding().onAppear{
                        isFamily = photoViewModel.isfamily == 1 ? true : false
                    }
                    Toggle("IsFriend", isOn: $isFriend).padding().onAppear{
                        isFriend = photoViewModel.isfriend == 1 ? true : false
                    }
                    Spacer()
                }
                Spacer()
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .onReceive(imageLoader.$image) { image in
                        self.image = image
                    }
                    .onAppear {
                        imageLoader.loadImage(for: photoViewModel.largeUrl)
                    }
                Spacer()
            }
            .padding(EdgeInsets(top: 0.0, leading: 10.0, bottom: 0.0, trailing: 10.0))
            
        }
    }
}
