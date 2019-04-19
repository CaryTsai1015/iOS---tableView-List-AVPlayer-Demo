//
//  CustomPlayerView.swift
//  video
//
//  Created by Tsai Cary on 2019/4/17.
//  Copyright © 2019 Tsai Cary. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class CustomPlayerView: UIView {
    
    override static var layerClass: AnyClass {
        return AVPlayerLayer.self
    }
    
    var playerLayer: AVPlayerLayer {
        return layer as! AVPlayerLayer
    }
    
    var player: AVPlayer? {
        get {
            return playerLayer.player
        }
        set {
            playerLayer.player = newValue
        }
    }
}
