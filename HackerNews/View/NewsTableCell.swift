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
