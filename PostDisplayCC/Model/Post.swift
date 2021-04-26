//
//  Post.swift
//  PostDisplayCC
//
//  Created by Bikram sapkota on 25/4/21.
//

import Foundation

struct Post:Decodable {
    var id:Int
    var userId:Int
    var title:String
    var body:String
    var imageUrl:String
    var thumbnailUrl:String
}

