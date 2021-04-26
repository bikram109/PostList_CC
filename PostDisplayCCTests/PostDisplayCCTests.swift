//
//  PostDisplayCCTests.swift
//  PostDisplayCCTests
//
//  Created by Bikram sapkota on 23/4/21.
//

import XCTest
@testable import PostDisplayCC

class PostDisplayCCTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    // Test view model is created or not
    func testPostViewModel(){
        let post = Post(id: 1, userId: 2, title: "test 1", body: "body 1", imageUrl: "imgurl", thumbnailUrl: "thumbnail.com")
        let postViewModel = PostViewModel(post: post)
        XCTAssertEqual(post.title, postViewModel.title)
        XCTAssertEqual(post.thumbnailUrl, postViewModel.thumbnailUrl)
    }


}
