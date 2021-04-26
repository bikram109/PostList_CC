//
//  Service.swift
//  PostDisplayCC
//
//  Created by Bikram sapkota on 23/4/21.
//

import UIKit

protocol Api {
    func fetchPosts(completion: @escaping ([Post]?, Error?) -> ())
}

class Service:Api {

    static let shared = Service()
    func fetchPosts(completion: @escaping ([Post]?, Error?) -> ()) {
        // reach the actual API

        let urlString = "https://ios-code-challenge.mockservice.io/posts"
        guard let url = URL(string: urlString) else { return }
            URLSession.shared.dataTask(with: url) { (data, resp, err) in
                // check for error
                    if let err = err {
                        completion(nil, err)
                        return
                    }
        
                    // check response
                guard let data = data else { return }
                do {
                    // convert json to object
                    let posts = try JSONDecoder().decode([Post].self, from: data)
                        DispatchQueue.main.async {
                            completion(posts, nil)
                        }
                    } catch let jsonErr {
                        print("Failed to decode:", jsonErr)
                    }
                    }.resume()
    }
}

