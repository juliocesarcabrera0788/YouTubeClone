//
//  ChannelCell.swift
//  YouTubeClone
//
//  Created by Julio Cabrera on 2024-02-22.
//

import UIKit
import Kingfisher

class ChannelCell: UITableViewCell {

    @IBOutlet weak var bannerImage: UIImageView!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var channeltitel: UILabel!
    @IBOutlet weak var channelInfoLabel: UILabel!
    @IBOutlet weak var subscriberNumbersLabel: UILabel!
    @IBOutlet weak var bellImage: UIImageView!
    @IBOutlet weak var subscribelLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
        
        
        bellImage.image = UIImage(named: "bell")?.withRenderingMode(.alwaysTemplate)
        bellImage.tintColor = UIColor(named: "grayColor")
        profileImage.layer.cornerRadius = 51/2
        selectionStyle = .none
        
    }

    func configCell(model: ChannelModel.Item){
        channelInfoLabel.text = model.snippet.description
        channeltitel.text = model.snippet.title
        subscriberNumbersLabel.text = "\(model.statistics?.subscriberCount ?? "0") subscribers \(model.statistics?.videoCount ?? "0") videos"
        
        if let imageBannerUrl = model.brandingSettings?.image.bannerExternalUrl, let bannerUrl = URL(string: imageBannerUrl){
            bannerImage.kf.setImage(with: bannerUrl)
        }
        
        
        let imageUrl = model.snippet.thumbnails.medium.url
        
        guard let url = URL(string: imageUrl) else {
            return
        }
        
        profileImage.kf.setImage(with: url)
        
    }
    
}
