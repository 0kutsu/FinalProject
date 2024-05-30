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
        let apiKey = "4757f00111aaa94410ff744e6435793e80d27d3180390228e8725ec7e7eb6740"
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


