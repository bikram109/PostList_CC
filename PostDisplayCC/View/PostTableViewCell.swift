//
//  PostTableViewCell.swift
//  PostDisplayCC
//
//  Created by Bikram sapkota on 25/4/21.
//

import UIKit
import SDWebImage

class PostTableViewCell: UITableViewCell {
    
    // 
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var thumbnailImg: UIImageView!
    @IBOutlet weak var bodyLbl: UILabel!
    
    // property observer
    // change in viewmodel from anywhere update our labels and images
    var postViewModel: PostViewModel! {
        didSet {
            titleLbl?.text = postViewModel.title
            thumbnailImg.sd_setImage(with: URL(string: postViewModel.thumbnailUrl), placeholderImage: UIImage(systemName: "photo"), options:.continueInBackground, completed: nil)
            bodyLbl.text = postViewModel.body
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
