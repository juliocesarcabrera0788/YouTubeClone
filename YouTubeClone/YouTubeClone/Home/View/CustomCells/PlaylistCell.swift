//
//  PlaylistCell.swift
//  YouTubeClone
//
//  Created by Julio Cabrera on 2024-02-22.
//

import UIKit
import Kingfisher

class PlaylistCell: UITableViewCell {

    @IBOutlet weak var videoImage: UIImageView!
    @IBOutlet weak var videoTitle: UILabel!
    @IBOutlet weak var videoCount: UILabel!
    
    @IBOutlet weak var dotsImage: UIImageView!
    @IBOutlet weak var videoCountOverlay: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        dotsImage.image = UIImage(named: "dots")?.withRenderingMode(.alwaysTemplate)
        dotsImage.tintColor = UIColor(named: "whiteColor")
        selectionStyle = .none
    }

    func configCell(model: PlaylistModel.Item){
        
        videoTitle.text = model.snippet.title
        videoCount.text = String(model.contentDetails.itemCount) + " videos"
        videoCountOverlay.text = String(model.contentDetails.itemCount)
        
        
        let imageUrl = model.snippet.thumbnails.medium.url
        
        
        if let url = URL(string: imageUrl){
            videoImage.kf.setImage(with: url)
        }
        
    }
    
}
