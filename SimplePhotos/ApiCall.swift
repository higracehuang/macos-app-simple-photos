//
//  ApiCall.swift
//  SimplePhotos
//
//  Created by Le Huang on 11/10/22.
//

import Foundation

class ApiCall {
    static func getPhotos(completion:@escaping ([Photo]) -> ()) {
        let getPhotosUrlString = "https://jsonplaceholder.typicode.com/photos"
        guard let url = URL(string: getPhotosUrlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let data = data {
                if let posts = try? JSONDecoder().decode([Photo].self, from: data) {
                    DispatchQueue.main.async {
                        completion(posts)
                    }
                    return
                }
            }
            print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
        }.resume()
    }
}
