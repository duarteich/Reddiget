//
//  RedditService.swift
//  Reddiget
//
//  Created by Christyan Huber Duarte Ibanez on 07/04/21.
//

import Foundation

enum RedditError: Error {
    case invalidResponse
    case noData
    case failedRequest
    case invalidData
}

class RedditService {
    typealias RedditDataCompletion = (RedditData?, RedditError?) -> ()
    
    private static let host = "reddit.com"
    private static let path = "/top.json"
    static let limit = 10
    
    static func topEntries(after: String?, completion: @escaping RedditDataCompletion) {
        var urlBuilder = URLComponents()
        urlBuilder.scheme = "https"
        urlBuilder.host = host
        urlBuilder.path = path
        urlBuilder.queryItems = [URLQueryItem(name: "limit", value: String(limit))]
        if let after = after, !after.isEmpty {
            urlBuilder.queryItems?.append(URLQueryItem(name: "after", value: after))
        }
        
        let url = urlBuilder.url!
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            DispatchQueue.main.async {
                guard error == nil else {
                    print("Failed request from Reddit: \(error!.localizedDescription)")
                    completion(nil, .failedRequest)
                    return
                }
                
                guard let data = data else {
                    print("No data returned from Reddit")
                    completion(nil, .noData)
                    return
                }
                
                guard let response = response as? HTTPURLResponse else {
                    print("Unable to process Reddit response")
                    completion(nil, .invalidResponse)
                    return
                }
                
                guard response.statusCode == 200 else {
                    print("Failure response from Reddit: \(response.statusCode)")
                    completion(nil, .failedRequest)
                    return
                }
                
                do {
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    let redditData: RedditData = try decoder.decode(RedditData.self, from: data)
                    completion(redditData, nil)
                } catch {
                    print("Unable to decode Reddit response: \(error.localizedDescription)")
                    completion(nil, .invalidData)
                }
            }
        }.resume()
    }
}
