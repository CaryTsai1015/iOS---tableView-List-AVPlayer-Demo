//
//  videoTableViewCell.swift
//  video
//
//  Created by Tsai Cary on 2019/4/17.
//  Copyright © 2019 Tsai Cary. All rights reserved.
//

import UIKit
import AVFoundation


class videoTableViewCell: UITableViewCell {

    
    
    @IBOutlet weak var playerView: CustomPlayerView!
    
    var mUrl = ""
    override func awakeFromNib() {
        super.awakeFromNib()
//        let url = URL(string: "http://yt-dash-mse-test.commondatastorage.googleapis.com/media/car-20120827-85.mp4")!

        
        
        




        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setPlayer(url:String){
        
//        let player = AVPlayer(url: URL(string:url)!)
//        let playerLayer = AVPlayerLayer(player: player)
////        playerLayer.frame = self.playerView.bounds
//        playerLayer.frame.size.height = playerView.frame.size.height
//        playerLayer.frame.size.width = playerView.frame.size.width
//        self.playerView.layer.addSublayer(playerLayer)
//        player.play()
//        
    }

    
}
