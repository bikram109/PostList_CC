//
//  MockService.swift
//  PostDisplayCC
//
//  Created by Bikram sapkota on 26/4/21.
//

import UIKit

class MockService:Api {
    static let shared = MockService()
    // delay the task execution to  check UI while loading
    private static let delay = 2
    
    func fetchPosts(completion: @escaping ([Post]?, Error?) -> ()) {
          // mock API data
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(MockService.delay)) {
                    // mock your data with simulated X-second delay
            let posts = Bundle.main.decode([Post].self, from: "post.json")
             completion(posts,nil)
        }
    }
}
