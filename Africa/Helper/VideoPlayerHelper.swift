//
//  VideoPlayerHelper.swift
//  Africa
//
//  Created by Samuel Brehm on 22/04/21.
//

import Foundation
import AVKit

var videoPlayer: AVPlayer?

func playVideo(fileName: String, fileFormat: String) -> AVPlayer {
    let URLVideoResource = Bundle.main.url(forResource: fileName, withExtension: fileFormat)
    
    if URLVideoResource != nil {
        videoPlayer = AVPlayer(url: URLVideoResource!)
        videoPlayer?.play()
    }
    
    return videoPlayer!
}
