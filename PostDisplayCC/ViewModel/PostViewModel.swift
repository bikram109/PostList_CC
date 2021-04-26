//
//  PostViewModel.swift
//  PostDisplayCC
//
//  Created by Bikram sapkota on 25/4/21.
//

import Foundation

struct PostViewModel {
    
    // Only propery which are realated to view
    let title: String
    let thumbnailUrl:String
    let body:String
        
    init(post: Post) {
        self.title = post.title
        self.thumbnailUrl = post.thumbnailUrl
        self.body = post.body
    }
    
      // view display logics goes here not in model
    
}
