//
//  NewsTableCell.swift
//  HackerNews
//
//  Created by Kuldeep Singh on 6/25/24.
//

import UIKit

class NewsTableCell: UITableViewCell {

//    @IBOutlet weak var newImageView: UIImageView!
    @IBOutlet weak var newsTitleLabel: UILabel!
    @IBOutlet weak var newsAuthorLabel: UILabel!
    @IBOutlet weak var newsCommentLabel: UILabel!
    @IBOutlet weak var newsLikesLabel: UILabel!
    
    
    var dataReceived: Hit? {
        didSet {
            if dataReceived != nil {
                loadData()
            }
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


extension NewsTableCell {
    func loadData(){
        guard let hit = dataReceived else { return }

        // Main thread for UI updates
        DispatchQueue.main.async { [weak self] in
            self?.newsTitleLabel.text = "Title: \(hit.title ?? "No Data fetched")"
            self?.newsAuthorLabel.text = "Author: \(hit.author ?? "No Data fetched")"
            self?.newsLikesLabel.text = String(hit.points ?? 0)
            self?.newsCommentLabel.text = String(hit.num_comments ?? 0)
        }
    }
}
