//
//  Search.swift
//  Final Project
//
//  Created by Joy Rao (student LM) on 5/7/24.
//

import Foundation

struct SerpApiResponse: Codable {
    let imagesResults: [SerpApiImage]
    
    private enum CodingKeys: String, CodingKey {
        case imagesResults = "images_results"
    }
}

struct SerpApiImage: Codable {
    let original: String
}

class SerpApiService: ObservableObject {
    @Published var images: [SerpApiImage] = []
    
    func fetchImages(query: String) {
        let apiKey = "27acff5d24141365418bb480c51944d351601db4dd35ba99143fb4acec031004"
        let urlString = "https://serpapi.com/search?engine=google_images&q=\(query)&num=10&api_key=\(apiKey)"
        
        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                print("Error fetching images: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            
            do {
                let decodedResponse = try JSONDecoder().decode(SerpApiResponse.self, from: data)
                DispatchQueue.main.async {
                    self.images = decodedResponse.imagesResults
                }
            } catch {
                print("Error decoding images: \(error.localizedDescription)")
            }
        }.resume()
    }
}

