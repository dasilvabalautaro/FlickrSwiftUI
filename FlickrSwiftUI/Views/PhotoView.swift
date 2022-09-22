//
//  PhotoView.swift
//  FlickrSwiftUI
//
//  Created by Arturo Silva Baldellon on 9/17/22.
//

import SwiftUI
import Resolver

struct PhotoView: View {
    var photoViewModel: PhotoViewModel
    
    @ObservedObject var imageLoader: ImageLoaderService = Resolver.resolve()
    
    @State var image: UIImage = UIImage()
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15.0, style:
                                .continuous)
                .fill(Color.gray)
                .padding(EdgeInsets(top: 0.0, leading: 5.0, bottom: 5.0, trailing: 5.0))
            HStack {
                Image(uiImage: image)
                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .aspectRatio(contentMode: .fit)
                    .onReceive(imageLoader.$image) { image in
                        self.image = image
                    }
                    .onAppear {
                        imageLoader.loadImage(for: photoViewModel.thumbnailUrl)
                    }
                    .cornerRadius(10.0)
                Text(String(photoViewModel.title))
                    .font(.headline).bold().italic()
                    .foregroundColor(.white)
                    
                Spacer()
            }
            .padding(EdgeInsets(top: 0.0, leading: 15.0, bottom: 5.0, trailing: 10.0))

        }
    }
}
