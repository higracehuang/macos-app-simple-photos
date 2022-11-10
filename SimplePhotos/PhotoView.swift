//
//  PhotoView.swift
//  SimplePhotos
//
//  Created by Le Huang on 11/10/22.
//

import SwiftUI

struct PhotoView: View {
    var photoData: Photo
    
    var body: some View {
        ZStack(alignment: .bottom) {
            AsyncImage(url: URL(string: photoData.thumbnailUrl)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } placeholder: {
                Color.gray
            }.frame(width: 200, height: 200)
            
            Text(photoData.title)
                .padding(5)
                .foregroundColor(.black)
                .frame(width: 200)
                .lineLimit(2)
        }
    }
}

struct PhotoView_Previews_Long: PreviewProvider {
    static var previews: some View {
        PhotoView(photoData: Photo(
            albumId: 1,
            id: 1,
            title: "short",
            url: "https://via.placeholder.com/600/92c952",
            thumbnailUrl: "https://via.placeholder.com/200/92c952"))
    }
}

struct PhotoView_Previews_Short: PreviewProvider {
    static var previews: some View {
        PhotoView(photoData: Photo(
            albumId: 1,
            id: 1,
            title: "officia delectus consequatur vero aut veniam explicabo molestias",
            url: "https://via.placeholder.com/160/56a8c2",
            thumbnailUrl: "https://via.placeholder.com/150/56a8c2"))
    }
}
