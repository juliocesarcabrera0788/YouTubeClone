//
//  VideoCell.swift
//  YouTubeClone
//
//  Created by Julio Cabrera on 2024-02-22.
//

import UIKit
import Kingfisher
class VideoCell: UITableViewCell {

    @IBOutlet weak var videoImage: UIImageView!
    @IBOutlet weak var videoName: UILabel!
    @IBOutlet weak var channelName: UILabel!
    @IBOutlet weak var viewCountLavel: UILabel!
    @IBOutlet weak var dotsImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configView()
    }
    
    private func configView(){
        selectionStyle = .none
    }
    
    func configCell(model:Any){
        
        dotsImage.image = UIImage(named: "dots")?.withRenderingMode(.alwaysTemplate)
        dotsImage.tintColor = UIColor(named: "whiteColor")
        
        if let video = model as? VideoModel.Item{
            if let imageUrl = video.snippet?.thumbnails.medium?.url, let url = URL(string: imageUrl){
                videoImage.kf.setImage(with: url)
            }
            videoName.text = video.snippet?.title ?? ""
            channelName.text = video.snippet?.channelTitle ?? ""
            viewCountLavel.text = "\(video.statistics?.viewCount ?? "0") views 3 months ago"
            
        }else if let playlistItems = model as? PlaylistItemModel.Item{
            
            if let imageUrl = playlistItems.snippet.thumbnails.medium?.url, let url = URL(string: imageUrl){
                videoImage.kf.setImage(with: url)
            }
            videoName.text = playlistItems.snippet.title
            channelName.text = playlistItems.snippet.channelTitle
            viewCountLavel.text = "333 views 3 months ago"
        }
    }

    
}
