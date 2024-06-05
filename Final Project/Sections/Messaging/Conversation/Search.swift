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
        // 50cb871f3e61a52ff3bed5be2150b62c2fbf3ec9ac826403f177daecfb233917 matis
        let apiKey = "8250ba6db24ddf05a38263babe451ba9c1ff506754f180dd3e759fa4c1dc557d"
        guard let encodedQuery = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {
            print("Invalid query")
            return
        }
        let urlString = "https://serpapi.com/search?engine=google_images&q=\(encodedQuery)&num=10&api_key=\(apiKey)"
        
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


