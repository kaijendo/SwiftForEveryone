//
//  NetworkingService.swift
//  EnumSearch
//
//  Created by Thuy Truong Quang on 6/19/18.
//  Copyright © 2018 Thuy Truong Quang. All rights reserved.
//

import Foundation
enum NetworkError: Error {
    case invalidURL
}
class NetworkingService {
     let endpoint = "https://www.xeno-canto.org/api/2/recordings"
    
    var task: URLSessionTask?
    
    func fetchRecordings(
        matching query: String?, page: Int,
        onCompletion: @escaping (RecordingsResult) -> Void) {
        
        func fireErrorCompletion(_ error: Error?) {
            onCompletion(RecordingsResult(recordings: nil, error: error,
                                          currentPage: 0, pageCount: 0))
        }
        
        var queryOrEmpty = "\'\'"
        
        if let query = query, !query.isEmpty {
            queryOrEmpty = query
        }
        
        var components = URLComponents(string: endpoint)
        components?.queryItems = [
            URLQueryItem(name: "query", value: queryOrEmpty),
            URLQueryItem(name: "page", value: String(page))
        ]
        
        guard let url = components?.url else {
            fireErrorCompletion(NetworkError.invalidURL)
            return
        }
        
        task?.cancel()
        
        task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            DispatchQueue.main.async {
                
                if let error = error {
                    guard (error as NSError).code != NSURLErrorCancelled else {
                        return
                    }
                    fireErrorCompletion(error)
                    return
                }
                
                guard let data = data else {
                    fireErrorCompletion(error)
                    return
                }
                
                do {
                    let result = try JSONDecoder().decode(ServiceResponse.self, from: data)
                    let first50 = result.recordings.prefix(50)
                    
                    onCompletion(RecordingsResult(recordings: Array(first50),
                                                  error: nil,
                                                  currentPage: result.page,
                                                  pageCount: result.numPages))
                } catch {
                    fireErrorCompletion(error)
                }
            }
        }
        
        task?.resume()
    }
    
}
