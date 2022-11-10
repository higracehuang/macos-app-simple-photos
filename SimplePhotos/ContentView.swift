//
//  ContentView.swift
//  SimplePhotos
//
//  Created by Le Huang on 11/9/22.
//

import SwiftUI

struct ContentView: View {
    @State var photos:[Photo] = []
    
    let columns = [GridItem](repeating: GridItem(.flexible()), count: 4)
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(photos, id: \.self) { photo in
                    PhotoView(photoData: photo)
                }
            }
            .padding(.horizontal)
            .onAppear {
                ApiCall.getPhotos(completion: { photos in
                    self.photos = photos
                })
            }.padding()
        }.frame(minWidth: 900, minHeight: 800)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
